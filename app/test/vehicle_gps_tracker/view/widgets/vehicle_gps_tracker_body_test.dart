// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/vehicle_gps_tracker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehicleGpsTrackerBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => VehicleGpsTrackerBloc(),
          child: MaterialApp(home: VehicleGpsTrackerBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
