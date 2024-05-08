import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:models/models.dart';
part 'vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this.vehiclesUseCase) : super(const VehiclesState()) {
    onStarted();
  }
  final VehiclesUseCase vehiclesUseCase;

  /// A description for yourCustomFunction
  FutureOr<void> onStarted() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final data = await vehiclesUseCase.getVehicles();

      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          data: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
