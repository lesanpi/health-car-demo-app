// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/vehicles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VehiclesBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => VehiclesCubit(),
          child: MaterialApp(home: VehiclesBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
