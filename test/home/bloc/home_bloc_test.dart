// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_car_demo_app/src/presentation/home/bloc/bloc.dart';

void main() {
  group('HomeBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BackgroundProcessBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final homeBloc = BackgroundProcessBloc();
      expect(homeBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<BackgroundProcessBloc, BackgroundProcessState>(
      'CustomHomeEvent emits nothing',
      build: BackgroundProcessBloc.new,
      act: (bloc) => bloc.add(const CustomHomeEvent()),
      expect: () => <BackgroundProcessState>[],
    );
  });
}
