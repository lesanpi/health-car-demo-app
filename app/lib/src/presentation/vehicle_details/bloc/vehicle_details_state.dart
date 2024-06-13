part of 'vehicle_details_bloc.dart';

/// {@template vehicle_details_state}
/// VehicleDetailsState description
/// {@endtemplate}
class VehicleDetailsState extends Equatable {
  /// {@macro vehicle_details_state}
  const VehicleDetailsState({
    this.status = FormzSubmissionStatus.initial,
    this.data,
  });
  final FormzSubmissionStatus status;
  final VehicleStatus? data;

  @override
  List<Object?> get props => [status, data];

  VehicleDetailsState copyWith({
    FormzSubmissionStatus? status,
    VehicleStatus? data,
  }) {
    return VehicleDetailsState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
