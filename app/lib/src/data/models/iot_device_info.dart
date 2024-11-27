import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:models/models.dart';

class IotDeviceInfo {
  const IotDeviceInfo({
    required this.kilometers,
    required this.vehicleId,
    required this.scannerStatus,
    required this.device,
    this.hasGpsSignal = false,
  });
  final int? kilometers;
  final String? vehicleId;
  final bool hasGpsSignal;
  final CreateVehicleStatusDto? scannerStatus;
  final BluetoothDevice device;
}
