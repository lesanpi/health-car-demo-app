import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:meta/meta.dart';
import 'package:models/models.dart';

part 'mileage_state.dart';

class MileageCubit extends Cubit<MileageState> {
  MileageCubit({
    required this.vehiclesUseCase,
    required this.vehicleId,
  }) : super(const MileageState()) {
    onStarted();
    _subscription =
        Stream<void>.periodic(const Duration(minutes: 1)).listen((_) {
      onStarted();
    });
  }
  final VehiclesUseCase vehiclesUseCase;
  final String vehicleId;

  StreamSubscription<void>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  /// A description for yourCustomFunction
  FutureOr<void> onStarted() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final data = await vehiclesUseCase.getLastReportOfVehicle(vehicleId);

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
