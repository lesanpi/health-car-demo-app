import 'package:models/models.dart';

abstract class IVehicleRepository {
  Future<ReportMileage> createReport(CreateReportDto data);

  Future<VehicleStatus> createVehicleStatus(CreateVehicleStatusDto data);

  Future<ReportMileage?> getLastReportOfVehicle(String vehicle);

  Future<ReportMileage?> getLastLocationVehicle(String vehicle);

  Future<VehicleStatus?> getLastVehicleStatus(String vehicle);

  Future<List<Vehicle>> getVehicles();
}
