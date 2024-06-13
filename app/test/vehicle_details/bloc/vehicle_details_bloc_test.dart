// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';

void main() {
  group('VehicleDetailsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          VehicleDetailsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final vehicleDetailsBloc = VehicleDetailsBloc();
      expect(vehicleDetailsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<VehicleDetailsBloc, VehicleDetailsState>(
      'CustomVehicleDetailsEvent emits nothing',
      build: VehicleDetailsBloc.new,
      act: (bloc) => bloc.add(const VehicleDetailsStarted()),
      expect: () => <VehicleDetailsState>[],
    );
  });
}
