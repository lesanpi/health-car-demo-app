import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:health_car_demo_app/src/data/models/iot_device_info.dart';

class BleCarApi {
  static const String _name = 'BleCarApi';
  static const String vehicleServiceUUID =
      '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  static const String kilometersCharacteristicUUID =
      'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  static const String vehiculeIdCharacteristicUUID =
      'beb5483e-36e1-4688-b7f5-ea07361b26a9';

  static Future<List<ScanResult>> scanDevices() async {
    /// Stop scanning before start another
    await FlutterBluePlus.stopScan();

    /// Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    /// Start new scan
    await FlutterBluePlus.startScan(
      withServices: [Guid.fromString('4fafc201-1fb5-459e-8fcc-c5c9c331914b')],
      timeout: const Duration(
        seconds: 10,
      ),
    );

    // Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;
    log(
      '✅ Scan finished. Results: ${FlutterBluePlus.lastScanResults}',
      name: 'ForegroundTask.results',
    );

    return FlutterBluePlus.lastScanResults;
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
              element.characteristicUuid.toString() ==
              'beb5483e-36e1-4688-b7f5-ea07361b26a8',
        )
        .toList();
    String? vehicleId;
    int? kilometers;
    for (final c in characteristics) {
      if (c.isVehicleIdCharacteristic) {
        vehicleId = await extractVehicleIdValue(c);
      }
      if (c.isVehicleKilometersCharacteristic) {
        kilometers = await extractVehicleKilometersValue(c);
      }
    }

    if (vehicleId == null || kilometers == null) throw Exception();
    return IotDeviceInfo(kilometers: kilometers, vehicleId: vehicleId);
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
        name: 'BLE.connection',
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
        final iotDeviceInfo = extractDeviceInfoFromService(service);
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
      characteristicUuid.toString() != BleCarApi.vehiculeIdCharacteristicUUID;
  bool get isVehicleKilometersCharacteristic =>
      characteristicUuid.toString() != BleCarApi.kilometersCharacteristicUUID;
}
