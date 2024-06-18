import 'package:models/models.dart';

class IotDeviceInfo {
  const IotDeviceInfo({
    required this.kilometers,
    required this.vehicleId,
    required this.scannerStatus,
  });
  final int? kilometers;
  final String? vehicleId;
  final CreateVehicleStatusDto? scannerStatus;
}
