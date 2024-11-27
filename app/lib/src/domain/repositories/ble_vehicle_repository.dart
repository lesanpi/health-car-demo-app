import 'dart:developer';

import 'package:health_car_demo_app/src/data/data_sources/ble_car_api.dart';
import 'package:health_car_demo_app/src/data/models/iot_device_info.dart';
import 'package:health_car_demo_app/src/domain/entities/vehicle_measure.dart';

class IBleVehiculeRepository {
  static Future<List<VehicleMeasure>> scanIoTDevices() async {
    final devices = await BleCarApi.scanDevices();
    final vehicleMeasuresList = <IotDeviceInfo>[];
    for (final device in devices) {
      final iotDevice = await BleCarApi.researchDevice(device);
      log(
        'Iot Device data ${iotDevice?.scannerStatus}',
        name: 'IBleVehicleRepository.scanIoTDevices',
      );
      if (iotDevice == null) continue;
      vehicleMeasuresList.add(iotDevice);
    }
    final results = vehicleMeasuresList
        .map(
          (e) => VehicleMeasure(
            kilometers: e.kilometers,
            vehicleId: e.vehicleId,
            scannerData: e.scannerStatus,
            hasGpsSignal: e.hasGpsSignal,
            device: e.device,
          ),
        )
        .toList();
    log(
      '✅ Results $results',
      name: 'IBleVehicleRepository.scanIoTDevices',
    );
    return results;
  }
}
