// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/vehicle_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehicleDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(VehicleDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders VehicleDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: VehicleDetailsPage()));
      expect(find.byType(VehicleDetailsView), findsOneWidget);
    });
  });
}
