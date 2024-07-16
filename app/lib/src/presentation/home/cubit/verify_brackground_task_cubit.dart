import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';
import 'package:meta/meta.dart';

part 'verify_brackground_task_state.dart';

class VerifyBrackgroundTaskCubit extends Cubit<VerifyBrackgroundTaskState> {
  VerifyBrackgroundTaskCubit(this.backgroundUseCase)
      : super(const VerifyBrackgroundTaskState()) {
    onStarted();
  }
  final BackgroundUseCase backgroundUseCase;

  Future<void> onStarted() async {
    final isEnabled = await backgroundUseCase.isEnabled();
    log(
      '📲 Permission is enabled? $isEnabled',
      name: 'VerifyBrackgroundTaskCubit',
    );
    emit(state.copyWith(enabled: isEnabled));

    final isRunning = await backgroundUseCase.isBackgroundProcessRunning();
    log(
      '🚙 Background service is running? $isRunning',
      name: 'VerifyBrackgroundTaskCubit',
    );
    if (!isRunning) {
      await backgroundUseCase.start();
    }
    log(
      '🚨 Background service started',
      name: 'VerifyBrackgroundTaskCubit',
    );
  }
}
