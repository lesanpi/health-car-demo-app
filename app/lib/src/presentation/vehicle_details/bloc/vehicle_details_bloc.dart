import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:models/models.dart';
part 'vehicle_details_event.dart';
part 'vehicle_details_state.dart';

class VehicleDetailsBloc
    extends Bloc<VehicleDetailsEvent, VehicleDetailsState> {
  VehicleDetailsBloc({
    required this.vehicle,
    required this.vehiclesUseCase,
  }) : super(const VehicleDetailsState()) {
    on<VehicleDetailsStarted>(_onStarted);
    add(const VehicleDetailsStarted());
  }
  final Vehicle vehicle;
  final VehiclesUseCase vehiclesUseCase;

  FutureOr<void> _onStarted(
    VehicleDetailsStarted event,
    Emitter<VehicleDetailsState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final data = await vehiclesUseCase.getLastVehicleStatus(vehicle.id);

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
