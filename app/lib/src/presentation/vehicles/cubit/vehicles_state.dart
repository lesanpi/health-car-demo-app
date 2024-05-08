// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicles_cubit.dart';

/// {@template vehicles}
/// VehiclesState description
/// {@endtemplate}
class VehiclesState extends Equatable {
  /// {@macro vehicles}
  const VehiclesState({
    this.status = FormzSubmissionStatus.initial,
    this.data = const [],
  });

  final FormzSubmissionStatus status;
  final List<Vehicle> data;

  @override
  List<Object> get props => [
        status,
        data,
      ];

  /// Creates a copy of the current VehiclesState with property changes
  VehiclesState copyWith({
    FormzSubmissionStatus? status,
    List<Vehicle>? data,
  }) {
    return VehiclesState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
