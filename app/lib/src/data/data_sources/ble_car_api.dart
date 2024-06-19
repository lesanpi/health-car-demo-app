import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:health_car_demo_app/src/data/models/iot_device_info.dart';
import 'package:models/models.dart';

class BleCarApi {
  static const String _name = 'BleCarApi';
  static const String vehicleServiceUUID =
      '4fafc201-1fb5-459e-8fcc-c5c9c331914b';

  /// Characteristics
  static const String kilometersCharacteristicUUID =
      'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  static const String vehiculeIdCharacteristicUUID =
      'beb5483e-36e1-4688-b7f5-ea07361b26a9';

  static const String scannerVehicleStatusCharacteristicUUID =
      'beb5483e-36e1-4688-b7f5-ea07361b26b8';

  static Future<List<BluetoothDevice>> scanDevices() async {
    /// Stop scanning before start another
    await FlutterBluePlus.stopScan();

    /// Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    /// Start new scan
    await FlutterBluePlus.startScan(
      withServices: [Guid.fromString(vehicleServiceUUID)],
      timeout: const Duration(
        seconds: 10,
      ),
    );

    // Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;
    log(
      '✅ Scan finished. Results: ${FlutterBluePlus.lastScanResults}',
      name: '$_name.results',
    );

    return FlutterBluePlus.lastScanResults.map((e) => e.device).toList();
  }

  static Future<String> extractVehicleIdValue(
    BluetoothCharacteristic characteristic,
  ) async {
    try {
      if (characteristic.characteristicUuid.toString() !=
          vehiculeIdCharacteristicUUID) {
        return '';
      }
      if (!characteristic.properties.read) return '';
      final value = await characteristic.read();
      final bytes = Uint8List.fromList(value);
      return utf8.decode(bytes);
    } catch (e) {
      return '';
    }
  }

  static Future<CreateVehicleStatusDto?> extractVehicleStatusValue(
    BluetoothCharacteristic characteristic,
  ) async {
    try {
      if (characteristic.characteristicUuid.toString() !=
          scannerVehicleStatusCharacteristicUUID) {
        return null;
      }
      if (!characteristic.properties.read) return null;
      final value = await characteristic.read();
      final bytes = Uint8List.fromList(value);
      final data = utf8.decode(bytes);
      log(
        'Extract vehicle status data $data',
        name: '$_name.extractVehicleStatusValue',
      );
      if (data.isEmpty) return null;
      return CreateVehicleStatusDto.fromJson(
        jsonDecode(data) as Map<String, dynamic>,
      );
    } catch (e, s) {
      log(
        'Extract vehicle status failed',
        error: e,
        stackTrace: s,
        name: '$_name.extractVehicleStatusValue',
      );
      return null;
    }
  }

  static Future<int> extractVehicleKilometersValue(
    BluetoothCharacteristic characteristic,
  ) async {
    try {
      if (characteristic.characteristicUuid.toString() !=
          kilometersCharacteristicUUID) {
        throw Exception();
      }
      if (!characteristic.properties.read) throw Exception();

      final value = await characteristic.read();
      final bytes = Uint8List.fromList(value);
      final byteData = ByteData.view(bytes.buffer);
      final integerValueLitle = byteData.getUint32(0, Endian.little);
      return integerValueLitle;
    } catch (e) {
      rethrow;
    }
  }

  static Future<IotDeviceInfo> extractDeviceInfoFromService(
    BluetoothService bluetoothService,
  ) async {
    final characteristics = bluetoothService.characteristics
        .where(
          (element) =>
              // element.characteristicUuid.toString() ==
              // 'beb5483e-36e1-4688-b7f5-ea07361b26a8',
              true,
        )
        .toList();

    log(
      'Characteristics ${characteristics.map((e) => e.characteristicUuid.toString()).toList()}',
      name: '$_name.extractDeviceInfoFromService',
    );
    String? vehicleId;
    int? kilometers;
    CreateVehicleStatusDto? vehicleStatusData;

    for (final c in characteristics) {
      log(
        'Characteristic ${c.characteristicUuid} IS ID ? ${c.isVehicleIdCharacteristic}, IS KM ? ${c.isVehicleKilometersCharacteristic}',
        name: '$_name.extractDeviceInfoFromService',
      );
      if (c.isVehicleIdCharacteristic) {
        vehicleId = await extractVehicleIdValue(c);
        log(
          'Vehicle id $vehicleId',
          name: '$_name.extractDeviceInfoFromService',
        );
      }
      if (c.isScannerVehicleCharacteristic) {
        vehicleStatusData = await extractVehicleStatusValue(c);
        log(
          'Vehicle Status: $vehicleStatusData',
          name: '$_name.extractDeviceInfoFromService',
        );
      }
      if (c.isVehicleKilometersCharacteristic) {
        // kilometers = 85;
        kilometers = await extractVehicleKilometersValue(c);
        log(
          'Kilometers: $kilometers Km',
          name: '$_name.extractDeviceInfoFromService',
        );
      }
    }

    return IotDeviceInfo(
      kilometers: kilometers,
      vehicleId: vehicleId,
      scannerStatus: vehicleStatusData,
    );
  }

  static Future<CreateVehicleStatusDto?> extractScannerData(
    BluetoothService bluetoothService,
  ) async {
    final characteristics = bluetoothService.characteristics
        .where(
          (element) =>
              // element.characteristicUuid.toString() ==
              // 'beb5483e-36e1-4688-b7f5-ea07361b26a8',
              true,
        )
        .toList();

    log(
      'Characteristics ${characteristics.map((e) => e.characteristicUuid.toString()).toList()}',
      name: '$_name.extractDeviceInfoFromService',
    );

    CreateVehicleStatusDto? vehicleStatusData;

    for (final c in characteristics) {
      log(
        'Characteristic ${c.characteristicUuid} ',
        name: '$_name.extractDeviceInfoFromService',
      );

      if (c.isScannerVehicleCharacteristic) {
        vehicleStatusData = await extractVehicleStatusValue(c);
        log(
          'Vehicle Status: $vehicleStatusData',
          name: '$_name.extractDeviceInfoFromService',
        );
      }
    }

    return vehicleStatusData;
  }

  static Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.removeBond();
    await device.disconnect();
    await device.connectionState
        .where((val) => val == BluetoothConnectionState.disconnected)
        .first;
    log(
      '🔌 Disconnect ${device.remoteId}: "${device.advName}"',
      name: '$_name.researchDevice',
    );
  }

  static Future<IotDeviceInfo?> researchDevice(BluetoothDevice device) async {
    try {
      log(
        '👷🏻 Working on ${device.remoteId}: "${device.advName}"',
        name: '$_name.researchDevice',
      );
      await device.connect();
      await device.connectionState
          .where((val) => val == BluetoothConnectionState.connected)
          .first;
      log(
        '✅🔥 ${device.remoteId}: "${device.advName}" connected!',
        name: '$_name.researchDevice',
      );

      final services = await device.discoverServices();
      final containService = services.any(
        (element) => element.serviceUuid.toString() == vehicleServiceUUID,
      );
      log(
        'Device Contain service ${containService ? '✅' : '❌'}',
        name: '$_name.researchDevice',
      );

      if (containService) {
        final service = services.firstWhere(
          (element) => element.serviceUuid.toString() == vehicleServiceUUID,
        );
        // final scannerData = await extractScannerData(service);
        final iotDeviceInfo = await extractDeviceInfoFromService(service);
        log(
          'Data Scanner ${iotDeviceInfo.scannerStatus}',
          name: '$_name.researchDevice',
        );
        await disconnectFromDevice(device);
        return iotDeviceInfo;
      }

      await disconnectFromDevice(device);
    } catch (e, s) {
      log(
        'Error received $e',
        error: e,
        stackTrace: s,
        name: '$_name.researchDevice',
      );
      return null;
    }
    return null;
  }
}

extension CharacteristicsExtension on BluetoothCharacteristic {
  bool get isVehicleIdCharacteristic =>
      characteristicUuid.toString() == BleCarApi.vehiculeIdCharacteristicUUID;

  bool get isScannerVehicleCharacteristic =>
      characteristicUuid.toString() ==
      BleCarApi.scannerVehicleStatusCharacteristicUUID;

  bool get isVehicleKilometersCharacteristic =>
      characteristicUuid.toString() == BleCarApi.kilometersCharacteristicUUID;
}
