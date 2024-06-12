import 'package:models/models.dart';

/// {@template vehicle_status_repository}
/// Vehicle Status repository
/// {@endtemplate}
abstract class VehicleStatusRepository {
  /// Get last [VehicleStatus] by [vehicle]
  Future<VehicleStatus> getLastVehicleStatusByVehicle(String vehicle);

  /// Create a [VehicleStatus] using [data]
  Future<VehicleStatus> createVehicleStatus(CreateVehicleStatusDto data);
}
