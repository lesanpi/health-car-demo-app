// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';

void main() {
  group('VehicleGpsTrackerState', () {
    test('supports value equality', () {
      expect(
        VehicleGpsTrackerState(),
        equals(
          const VehicleGpsTrackerState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const VehicleGpsTrackerState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const vehicleGpsTrackerState = VehicleGpsTrackerState(
            customProperty: 'My property',
          );
          expect(
            vehicleGpsTrackerState.copyWith(),
            equals(vehicleGpsTrackerState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const vehicleGpsTrackerState = VehicleGpsTrackerState(
            customProperty: 'My property',
          );
          final otherVehicleGpsTrackerState = VehicleGpsTrackerState(
            customProperty: 'My property 2',
          );
          expect(vehicleGpsTrackerState, isNot(equals(otherVehicleGpsTrackerState)));

          expect(
            vehicleGpsTrackerState.copyWith(
              customProperty: otherVehicleGpsTrackerState.customProperty,
            ),
            equals(otherVehicleGpsTrackerState),
          );
        },
      );
    });
  });
}
