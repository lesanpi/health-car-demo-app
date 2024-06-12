import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';

/// {@template vehicle_status_repository}
/// Vehicle Status repository
/// {@endtemplate}
abstract class VehicleStatusRepository {
  /// Get last [VehicleStatus] by [vehicle]
  Future<Either<Failure, VehicleStatus>> getLastVehicleStatusByVehicle(
    String vehicle,
  );

  /// Create a [VehicleStatus] using [data]
  Future<Either<Failure, VehicleStatus>> createVehicleStatus(
    CreateVehicleStatusDto data,
  );
}
