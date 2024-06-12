import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_vehicle_status_dto.freezed.dart';
part 'create_vehicle_status_dto.g.dart';

/// {@template create_vehicle_status}
/// Create Vehicle status description
/// {@endtemplate}
@freezed
class CreateVehicleStatusDto with _$CreateVehicleStatusDto {
  /// {@macro create_vehicle_status}
  const factory CreateVehicleStatusDto({
    required String vehicle,
    String? vin,
    bool? milOn,
    int? kmMILOn,
    int? minutesMILOn,
    List<String>? milCodes,
    double? coolantTemperature,
    double? oilTemperature,
    double? intakeAirTemperature,
    double? fuelPressure,
    double? absBaroPressure,
    double? manifoldPressureKpa,
    DateTime? createdAt,
  }) = _CreateVehicleStatusDto;

  factory CreateVehicleStatusDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVehicleStatusDtoFromJson(json);
}
