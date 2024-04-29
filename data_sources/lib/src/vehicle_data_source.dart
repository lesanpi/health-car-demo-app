import 'package:models/models.dart';

/// {@template vehicle_data_source}
/// Vehicle data source
/// {@endtemplate}
abstract class VehicleDataSource {
  /// Create [Vehicle] using [CreateVehicleDto] data
  Future<Vehicle> create(CreateVehicleDto data);

  /// Get and [Vehicle] using [id]
  /// return [Vehicle]
  Future<Vehicle> getVehicleById(String id);

  /// return last [ReportMileage] of vehicle [vehicleId]
  Future<ReportMileage> getLastReportOfVehicle(String vehicleId);

  /// Deletes and vehicle usign [id]
  /// return [OperationResultDto] with the status of the operation
  Future<OperationResultDto> deleteVehicle(String id);

  /// Updates the according [Vehicle] of the [id]
  /// using [data]
  /// return new [Vehicle] updated
  Future<Vehicle> updateVehicle({
    required String id,
    required CreateVehicleDto data,
  });

  /// Get all vehicles on the database
  /// returns a [List] of [Vehicle]
  Future<List<Vehicle>> getAllVehicles();
}
