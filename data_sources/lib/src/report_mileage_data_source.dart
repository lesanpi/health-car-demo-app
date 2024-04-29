import 'package:models/models.dart';

/// {@template report_mileage_data_source}
/// Report Mileage data source base class
/// {@endtemplate}
abstract class ReportMileageDataSource {
  /// Creates a new report using [data]
  /// Returns the [ReportMileage] created
  Future<ReportMileage> createReport(CreateReportDto data);

  /// Returns a [ReportMileage] according the [id]
  Future<ReportMileage> getReportById(String id);

  /// Delete a document of report according the [id] of the report
  /// return [OperationResultDto] with the result of the delete
  Future<OperationResultDto> deleteReport(String id);

  /// Returns a [List] of [ReportMileage] with all stored reports
  Future<List<ReportMileage>> getAllReports();

  /// Returns a [List] of [ReportMileage] with all stored reports
  /// of the corresponding vehicle [vehicleId]
  Future<List<ReportMileage>> getAllReportsByVehicle(String vehicleId);

  /// return last [ReportMileage] of vehicle [vehicleId]
  Future<ReportMileage> getLastReportOfVehicle(String vehicleId);
}
