// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/cubit.dart';

void main() {
  group('VehiclesCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          VehiclesCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final vehiclesCubit = VehiclesCubit();
      expect(vehiclesCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<VehiclesCubit, VehiclesState>(
      'yourCustomFunction emits nothing',
      build: VehiclesCubit.new,
      act: (cubit) => cubit.onStarted(),
      expect: () => <VehiclesState>[],
    );
  });
}
