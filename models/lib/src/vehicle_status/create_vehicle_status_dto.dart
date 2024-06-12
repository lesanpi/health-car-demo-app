import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
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

  /// Validate [json]
  static Either<ValidationFailure, CreateVehicleStatusDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};
      final vehicle = json['vehicle'] as String? ?? '';

      if (vehicle.isEmpty) {
        errors['vehicle'] = ['Vehicle is required'];
      }
      if (errors.isEmpty) return Right(CreateVehicleStatusDto.fromJson(json));
      throw BadRequestException(
        message: 'Validation failed',
        errors: errors,
      );
    } on BadRequestException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          statusCode: e.statusCode,
          errors: e.errors,
        ),
      );
    } on Exception {
      return const Left(
        ValidationFailure(
          message: 'Validation failed',
        ),
      );
    }
  }
}
