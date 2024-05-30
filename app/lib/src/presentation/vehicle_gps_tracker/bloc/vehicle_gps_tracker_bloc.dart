import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_car_demo_app/src/domain/entities/user_geolocation.dart';
import 'package:health_car_demo_app/src/domain/use_cases/location_use_case.dart';
import 'package:models/models.dart';
part 'vehicle_gps_tracker_event.dart';
part 'vehicle_gps_tracker_state.dart';

class VehicleGpsTrackerBloc
    extends Bloc<VehicleGpsTrackerEvent, VehicleGpsTrackerState> {
  VehicleGpsTrackerBloc({
    required this.vehicle,
    required LocationUseCase locationUseCase,
  })  : _locationUseCase = locationUseCase,
        super(VehicleGpsTrackerState(vehicle: vehicle)) {
    on<CustomVehicleGpsTrackerEvent>(_onCustomVehicleGpsTrackerEvent);
    on<_VehicleGpsTrackerTicket>(_onTicked);
    add(const _VehicleGpsTrackerTicket());
    tickSubs = Stream<void>.periodic(const Duration(seconds: 5)).listen(
      (event) {
        add(const _VehicleGpsTrackerTicket());
      },
    );
  }
  final Vehicle vehicle;
  final LocationUseCase _locationUseCase;
  StreamSubscription<void>? tickSubs;

  @override
  Future<void> close() async {
    await tickSubs?.cancel();
    await super.close();
  }

  FutureOr<void> _onCustomVehicleGpsTrackerEvent(
    CustomVehicleGpsTrackerEvent event,
    Emitter<VehicleGpsTrackerState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onTicked(
    _VehicleGpsTrackerTicket event,
    Emitter<VehicleGpsTrackerState> emit,
  ) async {
    final permissionGranted = await _locationUseCase.isPermissionGranted();
    log('Is permission granted $permissionGranted');
    emit(state.copyWith(isPermissionGranted: permissionGranted));
    final report = await _locationUseCase.getVehicleLastLocation(vehicle.id);
    log('Last report vehicle $report');
    emit(
      state.copyWith(reportMileage: report),
    );
  }
}
