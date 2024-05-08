// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/vehicles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehiclesPage', () {
    group('route', () {
      test('is routable', () {
        expect(VehiclesPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders VehiclesView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: VehiclesPage()));
      expect(find.byType(VehiclesView), findsOneWidget);
    });
  });
}
