// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';

void main() {
  group('VehicleGpsTrackerBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          VehicleGpsTrackerBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final vehicleGpsTrackerBloc = VehicleGpsTrackerBloc();
      expect(vehicleGpsTrackerBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<VehicleGpsTrackerBloc, VehicleGpsTrackerState>(
      'CustomVehicleGpsTrackerEvent emits nothing',
      build: VehicleGpsTrackerBloc.new,
      act: (bloc) => bloc.add(const CustomVehicleGpsTrackerEvent()),
      expect: () => <VehicleGpsTrackerState>[],
    );
  });
}
