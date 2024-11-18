// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:health_car_demo_app/main_development.dart';
import 'package:health_car_demo_app/src/data/data_sources/geolocation/fl_geolocation_api.dart';
import 'package:health_car_demo_app/src/data/data_sources/geolocation/gelocation_api_plugin.dart';
import 'package:health_car_demo_app/src/data/data_sources/report_mileage_api/report_mileage_api.dart';
import 'package:health_car_demo_app/src/data/data_sources/vehicle_api/vehicle_api.dart';
import 'package:health_car_demo_app/src/data/data_sources/vehicle_status_api/vehicle_status_api.dart';
import 'package:health_car_demo_app/src/data/repositories/geolocation_repository.dart';
import 'package:health_car_demo_app/src/data/repositories/vehicle_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/ble_vehicle_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/repositories.dart';
import 'package:models/models.dart';

class BackgroundUseCase {
  BackgroundUseCase({
    required this.backgroundRepository,
  });

  final IBackgroundRepository backgroundRepository;
  Future<bool> isEnabled() => backgroundRepository.isEnabled();
  Future<void> requestPermissions() async {
    final enabled = await backgroundRepository.isEnabled();
    if (!enabled) {
      return backgroundRepository.requestPermissions();
    }
  }

  Future<bool> isBackgroundProcessRunning() =>
      backgroundRepository.isBackgroundProcessRunning();

  Future<void> initService() {
    return backgroundRepository.initService();
  }

  Future<void> start() {
    return backgroundRepository.start();
  }

  static Future<void> executeBackgroundProcess() async {
    final geolocationRepository = GeolocationRepository(
      // geolocationApi: FlGeolocationApi(),
      geolocationApi: GeolocationApiPlugin(),
    );
    final userLocation = await geolocationRepository.getCurrentPosition();
    log('User Location: $userLocation');
    final vehicleMeasures = await IBleVehiculeRepository.scanIoTDevices();

    // const apiHost = 'healt-car-api.globeapp.dev';

    final repository = VehicleRepository(
      apiReports: ReportMileageApi(apiHost: apiHost),
      apiVehicle: VehicleApi(apiHost: apiHost),
      apiStatus: VehicleStatusApi(apiHost: apiHost),
    );
    for (final element in vehicleMeasures) {
      try {
        final vehicleId = element.vehicleId;
        final kilometers = element.kilometers;
        final scannerData = element.scannerData;
        final hasGpsSignal = element.hasGpsSignal;
        log(
          'Scanner data $scannerData',
          name: 'BackgroundUseCase',
        );
        if (vehicleId != null && kilometers != null) {
          try {
            log(
              'createReport loading $vehicleId $kilometers...',
              name: 'BackgroundUseCase',
            );
            await repository.createReport(
              CreateReportDto(
                vehicle: vehicleId,
                mileage: kilometers,
                geolocation: userLocation,
              ),
            );
          } catch (e, s) {
            log(
              'Error creating report',
              error: e,
              stackTrace: s,
              name: 'BackgroundUseCase',
            );
          }
        }
        if (scannerData != null) {
          try {
            log(
              'createVehicleStatus loading $scannerData...',
              name: 'BackgroundUseCase',
            );
            await repository.createVehicleStatus(scannerData);
          } catch (e, s) {
            log(
              'Error creating satatus',
              error: e,
              stackTrace: s,
              name: 'BackgroundUseCase',
            );
          }
        }
      } finally {}
    }
  }
}
