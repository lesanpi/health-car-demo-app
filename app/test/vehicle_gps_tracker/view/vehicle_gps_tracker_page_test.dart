// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/vehicle_gps_tracker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehicleGpsTrackerPage', () {
    group('route', () {
      test('is routable', () {
        expect(VehicleGpsTrackerPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders VehicleGpsTrackerView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: VehicleGpsTrackerPage()));
      expect(find.byType(VehicleGpsTrackerView), findsOneWidget);
    });
  });
}
