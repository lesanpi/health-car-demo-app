// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:health_car_demo_app/src/domain/repositories/vehicle_repository.dart';
import 'package:models/models.dart';

class VehiclesUseCase {
  VehiclesUseCase({
    required IVehicleRepository vehicleRepository,
  }) : _vehicleRepository = vehicleRepository;
  final IVehicleRepository _vehicleRepository;

  Future<List<Vehicle>> getVehicles() {
    return _vehicleRepository.getVehicles();
  }

  Future<ReportMileage> getLastReportOfVehicle(String vehicleId) {
    return _vehicleRepository.getLastReportOfVehicle(vehicleId);
  }
}
