import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';
part 'background_process_event.dart';
part 'background_process_state.dart';

class BackgroundProcessBloc
    extends Bloc<BackgroundProcessEvent, BackgroundProcessState> {
  BackgroundProcessBloc(this.backgroundUseCase) : super(const HomeInitial()) {
    on<CustomHomeEvent>(_onCustomHomeEvent);
    on<BackgroundProcessStarted>(_onStarted);
    on<RequestPermissionPressed>(_onRequestPermissionPressed);
    add(const BackgroundProcessStarted());
  }
  final BackgroundUseCase backgroundUseCase;

  FutureOr<void> _onCustomHomeEvent(
    CustomHomeEvent event,
    Emitter<BackgroundProcessState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onStarted(
    BackgroundProcessStarted event,
    Emitter<BackgroundProcessState> emit,
  ) async {
    try {
      await backgroundUseCase.initService();
      emit(state.copyWith(initializedService: true));
    } catch (e) {
      emit(state.copyWith(initializedService: false));
    }
  }

  FutureOr<void> _onRequestPermissionPressed(
    RequestPermissionPressed event,
    Emitter<BackgroundProcessState> emit,
  ) async {
    try {
      await backgroundUseCase.requestPermissions();
      await backgroundUseCase.start();
    } catch (e, s) {
      log(
        'Error $e',
        name: 'HomeBloc.HomeRequestPermissionPressed',
        stackTrace: s,
      );
    }
  }
}
