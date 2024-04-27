// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/home/bloc/bloc.dart';

void main() {
  group('HomeState', () {
    test('supports value equality', () {
      expect(
        BackgroundProcessState(),
        equals(
          const BackgroundProcessState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BackgroundProcessState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const homeState = BackgroundProcessState(
            customProperty: 'My property',
          );
          expect(
            homeState.copyWith(),
            equals(homeState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const homeState = BackgroundProcessState(
            customProperty: 'My property',
          );
          final otherHomeState = BackgroundProcessState(
            customProperty: 'My property 2',
          );
          expect(homeState, isNot(equals(otherHomeState)));

          expect(
            homeState.copyWith(
              customProperty: otherHomeState.customProperty,
            ),
            equals(otherHomeState),
          );
        },
      );
    });
  });
}
