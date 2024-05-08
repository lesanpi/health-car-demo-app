// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:health_car_demo_app/src/data/data_sources/report_mileage_api/report_mileage_api.dart';
import 'package:health_car_demo_app/src/data/data_sources/vehicle_api/vehicle_api.dart';
import 'package:health_car_demo_app/src/domain/repositories/vehicle_repository.dart';
import 'package:models/src/report_mileage/create_report_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';
import 'package:models/src/vehicle/vehicle.dart';

class VehicleRepository extends IVehicleRepository {
  VehicleRepository({
    required ReportMileageApi apiReports,
    required VehicleApi apiVehicle,
  })  : _apiReports = apiReports,
        _apiVehicle = apiVehicle;
  final ReportMileageApi _apiReports;
  final VehicleApi _apiVehicle;

  @override
  Future<ReportMileage> createReport(CreateReportDto data) {
    return _apiReports.createReport(data);
  }

  @override
  Future<ReportMileage> getLastReportOfVehicle(String vehicle) {
    return _apiReports.getLastReportOfVehicle(vehicle);
  }

  @override
  Future<List<Vehicle>> getVehicles() async {
    try {
      log(
        '🧭 Loading getVehicles...',
      );
      final vehicles = await _apiVehicle.getAllVehicles();
      log(
        '🧭✅ GetVehicles... $vehicles',
      );
      return vehicles;
    } catch (e, s) {
      log(
        'Error on getVehicles: $e',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
