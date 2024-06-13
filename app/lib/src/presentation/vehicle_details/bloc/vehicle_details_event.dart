part of 'vehicle_details_bloc.dart';

abstract class VehicleDetailsEvent extends Equatable {
  const VehicleDetailsEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_vehicle_details_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class VehicleDetailsStarted extends VehicleDetailsEvent {
  /// {@macro custom_vehicle_details_event}
  const VehicleDetailsStarted();
}
