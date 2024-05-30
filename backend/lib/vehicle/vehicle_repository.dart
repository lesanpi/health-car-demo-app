import 'package:data_sources/data_sources.dart';
import 'package:either_dart/src/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/src/failures.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

/// {@template vehicle_repository}
/// Vehicle repository implementation
/// {@endtemplate}
class VehicleRepositoryImpl extends VehicleRepository {
  /// {@macro vehicle_repository}
  VehicleRepositoryImpl({required this.dataSource});

  /// The data source used to perform CRUD operations
  final VehicleDataSource dataSource;

  @override
  Future<Either<Failure, Vehicle>> createVehicle(CreateVehicleDto data) async {
    try {
      final vehicle = await dataSource.create(data);
      return Right(vehicle);
    } on InternalServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, OperationResultDto>> deleteVehicle(String id) async {
    try {
      final result = await dataSource.deleteVehicle(id);
      return Right(result);
    } on InternalServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Vehicle>>> getAllVehicles() async {
    try {
      final vehicles = await dataSource.getAllVehicles();
      return Right(vehicles);
    } on InternalServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Vehicle>> getVehicleById(String id) async {
    try {
      final vehicle = await dataSource.getVehicleById(id);
      return Right(vehicle);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ReportMileage?>> getLastLocationReport(
    String vehicle,
  ) async {
    try {
      final report = await dataSource.getLastReportLocationOfVehicle(vehicle);
      return Right(report);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
