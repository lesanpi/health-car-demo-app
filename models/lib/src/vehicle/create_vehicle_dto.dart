import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_vehicle_dto.freezed.dart';
part 'create_vehicle_dto.g.dart';

/// {@template create_vehicle_dto}
/// CreateVehicleDto description
/// {@endtemplate}
@freezed
class CreateVehicleDto with _$CreateVehicleDto {
  /// {@macro create_vehicle_dto}
  const factory CreateVehicleDto({
    required String name,
    required String photo,
  }) = _CreateVehicleDto;

  /// Creates a CreateVehicleDto from Json map
  factory CreateVehicleDto.fromJson(Map<String, dynamic> data) =>
      _$CreateVehicleDtoFromJson(data);

  /// Validate json [Map]
  static Either<ValidationFailure, CreateVehicleDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};

      final name = json['name'] as String? ?? '';
      final photo = json['photo'] as String? ?? '';

      if (name.isEmpty) {
        errors['name'] = ['Name is required'];
      }

      if (photo.isEmpty) {
        errors['photo'] = ['Photo is required'];
      }

      if (errors.isEmpty) return Right(CreateVehicleDto.fromJson(json));
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
