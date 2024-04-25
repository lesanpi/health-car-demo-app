// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:health_car_demo_app/src/domain/repositories/ble_vehicle_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/repositories.dart';

class BackgroundUseCase {
  BackgroundUseCase({
    required this.backgroundRepository,
  });

  final IBackgroundRepository backgroundRepository;
  Future<bool> isEnabled() => backgroundRepository.isEnabled();
  Future<void> requestPermissions() {
    return backgroundRepository.requestPermissions();
  }

  static Future<void> executeBackgroundProcess() async {
    final vehicleMeasures = await IBleVehiculeRepository.scanIoTDevices();
  }
}
