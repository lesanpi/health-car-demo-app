// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/cubit.dart';

void main() {
  group('VehiclesState', () {
    test('supports value equality', () {
      expect(
        VehiclesState(),
        equals(
          const VehiclesState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const VehiclesState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const vehiclesState = VehiclesState(
            customProperty: 'My property',
          );
          expect(
            vehiclesState.copyWith(),
            equals(vehiclesState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const vehiclesState = VehiclesState(
            customProperty: 'My property',
          );
          final otherVehiclesState = VehiclesState(
            customProperty: 'My property 2',
          );
          expect(vehiclesState, isNot(equals(otherVehiclesState)));

          expect(
            vehiclesState.copyWith(
              customProperty: otherVehiclesState.customProperty,
            ),
            equals(otherVehiclesState),
          );
        },
      );
    });
  });
}
