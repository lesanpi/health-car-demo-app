// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'mileage_cubit.dart';

class MileageState extends Equatable {
  const MileageState({
    this.status = FormzSubmissionStatus.initial,
    this.data,
  });
  final FormzSubmissionStatus status;
  final ReportMileage? data;

  @override
  List<Object?> get props => [status, data];

  MileageState copyWith({
    FormzSubmissionStatus? status,
    ReportMileage? data,
  }) {
    return MileageState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
