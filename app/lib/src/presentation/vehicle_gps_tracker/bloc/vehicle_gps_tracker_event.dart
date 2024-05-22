part of 'vehicle_gps_tracker_bloc.dart';

abstract class VehicleGpsTrackerEvent extends Equatable {
  const VehicleGpsTrackerEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_vehicle_gps_tracker_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomVehicleGpsTrackerEvent extends VehicleGpsTrackerEvent {
  /// {@macro custom_vehicle_gps_tracker_event}
  const CustomVehicleGpsTrackerEvent();
}

class _VehicleGpsTrackerTicket extends VehicleGpsTrackerEvent {
  const _VehicleGpsTrackerTicket();
}
