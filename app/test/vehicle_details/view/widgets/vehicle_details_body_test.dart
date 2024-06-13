// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/vehicle_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehicleDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => VehicleDetailsBloc(),
          child: MaterialApp(home: VehicleDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
