import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';

/// {@template vehicle_repository}
/// Base class for all vehicle repositories
/// {@endtemplate}
abstract class VehicleRepository {
  /// Get a Vehicle using [id]
  Future<Either<Failure, Vehicle>> getVehicleById(String id);

  /// Get all vehicles
  Future<Either<Failure, List<Vehicle>>> getAllVehicles();

  /// Delete a vehicle document using [id]
  Future<Either<Failure, OperationResultDto>> deleteVehicle(String id);

  /// Create a new [Vehicle] using [data]
  Future<Either<Failure, Vehicle>> createVehicle(
    CreateVehicleDto data,
  );

  /// Get last location report
  Future<Either<Failure, ReportMileage?>> getLastLocationReport(
    String vehicle,
  );
}
