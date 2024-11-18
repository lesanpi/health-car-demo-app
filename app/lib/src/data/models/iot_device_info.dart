import 'package:models/models.dart';

class IotDeviceInfo {
  const IotDeviceInfo({
    required this.kilometers,
    required this.vehicleId,
    required this.scannerStatus,
    this.hasGpsSignal = false,
  });
  final int? kilometers;
  final String? vehicleId;
  final bool hasGpsSignal;
  final CreateVehicleStatusDto? scannerStatus;
}
