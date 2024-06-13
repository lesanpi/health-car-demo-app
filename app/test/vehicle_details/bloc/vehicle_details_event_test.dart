// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';

void main() {
  group('VehicleDetailsEvent', () {
    group('CustomVehicleDetailsEvent', () {
      test('supports value equality', () {
        expect(
          VehicleDetailsStarted(),
          equals(const VehicleDetailsStarted()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const VehicleDetailsStarted(),
          isNotNull,
        );
      });
    });
  });
}
