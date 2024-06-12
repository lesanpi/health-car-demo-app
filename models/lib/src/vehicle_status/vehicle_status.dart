import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_status.freezed.dart';
part 'vehicle_status.g.dart';

/// {@template vehicle_status}
/// Vehicle status description
/// {@endtemplate}
@freezed
class VehicleStatus with _$VehicleStatus {
  /// {@macro vehicle_status}
  const factory VehicleStatus({
    @JsonKey(name: '_id') required String id,
    required String vehicle,
    required String vin,
    required bool milOn,
    required List<String> milCodes,
    required double coolantTemperature,
    required double oilTemperature,
    required double intakeAirTemperature,
    required double fuelPressure,
    required double absBaroPressure,
    required double manifoldPressureKpa,
    required DateTime createdAt,
    @Default(0) int kmMILOn,
    @Default(0) int minutesMILOn,
  }) = _VehicleStatus;

  factory VehicleStatus.fromJson(Map<String, dynamic> json) =>
      _$VehicleStatusFromJson(json);
}
