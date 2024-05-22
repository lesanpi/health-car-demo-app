part of 'vehicle_gps_tracker_bloc.dart';

/// {@template vehicle_gps_tracker_state}
/// VehicleGpsTrackerState description
/// {@endtemplate}
class VehicleGpsTrackerState extends Equatable {
  /// {@macro vehicle_gps_tracker_state}
  const VehicleGpsTrackerState({
    required this.vehicle,
    this.isPermissionGranted = false,
    this.reportMileage,
  });

  final Vehicle vehicle;
  final bool isPermissionGranted;
  final ReportMileage? reportMileage;

  @override
  List<Object?> get props => [
        isPermissionGranted,
        reportMileage,
      ];

  /// Creates a copy of the current MapSearchState with property changes
  VehicleGpsTrackerState copyWith({
    bool? isPermissionGranted,
    ReportMileage? reportMileage,
  }) {
    return VehicleGpsTrackerState(
      vehicle: vehicle,
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      reportMileage: reportMileage ?? this.reportMileage,
    );
  }
}
