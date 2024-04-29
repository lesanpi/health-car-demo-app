import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';

/// {@template report_mileage_repository}
/// Base class for all report mileage repositories
/// {@endtemplate}
abstract class ReportMileageRepository {
  /// Get a [ReportMileage] using [id]
  Future<Either<Failure, ReportMileage>> getReportById(String id);

  /// Get all reports [ReportMileage]
  Future<Either<Failure, List<ReportMileage>>> getAllReports();

  /// Get all reports [ReportMileage] of corresponding vehicle id [vehicleId]
  Future<Either<Failure, List<ReportMileage>>> getAllReportsOfVehicle(
    String vehicleId,
  );

  /// Get last mileage report of [vehicleId] id
  Future<Either<Failure, ReportMileage>> getLastReportMileageOfVehicle(
    String vehicleId,
  );

  /// Delete a report document using [id]
  Future<Either<Failure, OperationResultDto>> deleteReport(String id);

  /// Create a new [ReportMileage] using [data]
  Future<Either<Failure, Vehicle>> createReport(
    CreateReportDto data,
  );
}
