// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_sources/data_sources.dart';
import 'package:either_dart/src/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/src/failures.dart';
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/report_mileage/create_report_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';
import 'package:models/src/vehicle/vehicle.dart';
import 'package:repository/repository.dart';

class ReportMileageRepositoryImpl extends ReportMileageRepository {
  ReportMileageRepositoryImpl({
    required ReportMileageDataSource dataSource,
    required VehicleDataSource vehicleDataSource,
  })  : _dataSource = dataSource,
        _vehicleDataSource = vehicleDataSource;
  final ReportMileageDataSource _dataSource;
  final VehicleDataSource _vehicleDataSource;

  @override
  Future<Either<Failure, ReportMileage>> createReport(
    CreateReportDto data,
  ) async {
    try {
      final _ = await _vehicleDataSource.getVehicleById(data.vehicle);
      final report = await _dataSource.createReport(data);
      return Right(report);
    } on HttpException catch (e, s) {
      print('Exception on createReport: $e, $s');
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } catch (e, s) {
      print('Exception on createReport: $e, $s');
    }
  }

  @override
  Future<Either<Failure, OperationResultDto>> deleteReport(String id) async {
    try {
      final reports = await _dataSource.deleteReport(id);
      return Right(reports);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReportMileage>>> getAllReports() async {
    try {
      final reports = await _dataSource.getAllReports();
      return Right(reports);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReportMileage>>> getAllReportsOfVehicle(
    String vehicleId,
  ) async {
    try {
      final reports = await _dataSource.getAllReportsByVehicle(vehicleId);
      return Right(reports);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ReportMileage>> getLastReportMileageOfVehicle(
    String vehicleId,
  ) async {
    try {
      final report = await _dataSource.getLastReportOfVehicle(vehicleId);
      return Right(report);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ReportMileage>> getReportById(String id) async {
    try {
      final report = await _dataSource.getReportById(id);
      return Right(report);
    } on HttpException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
