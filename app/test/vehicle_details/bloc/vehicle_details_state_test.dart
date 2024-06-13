// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';

void main() {
  group('VehicleDetailsState', () {
    test('supports value equality', () {
      expect(
        VehicleDetailsState(),
        equals(
          const VehicleDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const VehicleDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const vehicleDetailsState = VehicleDetailsState(
            customProperty: 'My property',
          );
          expect(
            vehicleDetailsState.copyWith(),
            equals(vehicleDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const vehicleDetailsState = VehicleDetailsState(
            customProperty: 'My property',
          );
          final otherVehicleDetailsState = VehicleDetailsState(
            customProperty: 'My property 2',
          );
          expect(vehicleDetailsState, isNot(equals(otherVehicleDetailsState)));

          expect(
            vehicleDetailsState.copyWith(
              customProperty: otherVehicleDetailsState.customProperty,
            ),
            equals(otherVehicleDetailsState),
          );
        },
      );
    });
  });
}
