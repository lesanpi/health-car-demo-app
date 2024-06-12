// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_sources/data_sources.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:models/src/vehicle_status/create_vehicle_status_dto.dart';
import 'package:models/src/vehicle_status/vehicle_status.dart';
import 'package:repository/repository.dart';

class VehicleStatusRepositoryImpl extends VehicleStatusRepository {
  VehicleStatusRepositoryImpl({
    required this.dataSource,
  });
  final VehicleStatusDataSource dataSource;

  @override
  Future<Either<Failure, VehicleStatus>> createVehicleStatus(
    CreateVehicleStatusDto data,
  ) async {
    try {
      final result = await dataSource.create(data);
      return Right(result);
    } on InternalServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'Exception: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, VehicleStatus>> getLastVehicleStatusByVehicle(
    String vehicle,
  ) async {
    try {
      final result = await dataSource.getLastVehicleStatus(vehicle);
      return Right(result);
    } on InternalServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'Exception: $e'),
      );
    }
  }
}
