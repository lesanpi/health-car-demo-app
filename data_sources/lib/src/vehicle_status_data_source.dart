import 'package:models/models.dart';

/// {@template vehicle_status_data_source}
/// Vehicle Status data source
/// {@endtemplate}
abstract class VehicleStatusDataSource {
  /// Create vehicle status
  /// returns [VehicleStatus] created
  Future<VehicleStatus> create(CreateVehicleStatusDto data);

  /// Get [VehicleStatus] by [id] in db
  Future<VehicleStatus> getVehicleStatusById(String id);

  /// return last [VehicleStatus] of vehicle [vehicleId]
  Future<ReportMileage> getLastVehicleStatus(String vehicleId);

  /// Deletes an vehicle status using [id]
  /// return [OperationResultDto] with the status of the operation
  Future<OperationResultDto> deleteVehicleStatus(String id);

  /// Get all vehicle status of a [vehicle]
  /// returns [List] of [VehicleStatus]
  Future<List<VehicleStatus>> getAllVehicleStatusesByVehicle(String vehicle);
}
