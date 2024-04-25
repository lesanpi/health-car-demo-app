import 'package:health_car_demo_app/src/data/data_sources/ble_car_api.dart';
import 'package:health_car_demo_app/src/data/models/iot_device_info.dart';
import 'package:health_car_demo_app/src/domain/entities/vehicle_measure.dart';

class IBleVehiculeRepository {
  static Future<List<VehicleMeasure>> scanIoTDevices() async {
    final devices = await BleCarApi.scanDevices();
    final vehicleMeasuresList = <IotDeviceInfo>[];
    for (final device in devices) {
      final iotDevice = await BleCarApi.researchDevice(device);
      if (iotDevice == null) continue;
      vehicleMeasuresList.add(iotDevice);
    }
    return vehicleMeasuresList
        .map(
          (e) =>
              VehicleMeasure(kilometers: e.kilometers, vehicleId: e.vehicleId),
        )
        .toList();
  }
}
