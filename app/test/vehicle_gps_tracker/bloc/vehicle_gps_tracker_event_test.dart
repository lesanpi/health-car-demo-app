// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';

void main() {
  group('VehicleGpsTrackerEvent', () {  
    group('CustomVehicleGpsTrackerEvent', () {
      test('supports value equality', () {
        expect(
          CustomVehicleGpsTrackerEvent(),
          equals(const CustomVehicleGpsTrackerEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomVehicleGpsTrackerEvent(),
          isNotNull
        );
      });
    });
  });
}
