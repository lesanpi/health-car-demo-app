import 'package:models/models.dart';

abstract class IVehicleRepository {
  Future<ReportMileage> createReport(CreateReportDto data);

  Future<ReportMileage?> getLastReportOfVehicle(String vehicle);

  Future<List<Vehicle>> getVehicles();
}
