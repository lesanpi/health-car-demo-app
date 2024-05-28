import 'package:health_car_demo_app/src/domain/entities/user_geolocation.dart';
import 'package:health_car_demo_app/src/domain/repositories/geolocation_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/vehicle_repository.dart';
import 'package:models/models.dart';

class LocationUseCase {
  LocationUseCase({
    required this.geolocationRepository,
    required this.vehicleRepository,
  });

  final IGeolocationRepository geolocationRepository;
  final IVehicleRepository vehicleRepository;

  Future<bool> isPermissionGranted() =>
      geolocationRepository.isGeolocationPermissionGranted();

  Future<Geolocation?> getCurrentPosition() async {
    return geolocationRepository.getCurrentPosition();
  }

  Future<ReportMileage?> getLastReportOfVehicle(String vehicleId) {
    return vehicleRepository.getLastReportOfVehicle(vehicleId);
  }
}
