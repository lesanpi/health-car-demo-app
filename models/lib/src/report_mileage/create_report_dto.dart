import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/geolocation/geolocation.dart';

part 'create_report_dto.freezed.dart';
part 'create_report_dto.g.dart';

/// {@template create_report_dto}
/// CreateReportDto description
/// {@endtemplate}
@freezed
class CreateReportDto with _$CreateReportDto {
  /// {@macro create_report_dto}
  const factory CreateReportDto({
    required String vehicle,
    required int mileage,
    @Default('') String channel,
    @Default('') String device,
    Geolocation? geolocation,
  }) = _CreateReportDto;

  /// Creates a CreateReportDto from Json map
  factory CreateReportDto.fromJson(Map<String, dynamic> data) =>
      _$CreateReportDtoFromJson(data);

  /// Validate [json]
  static Either<ValidationFailure, CreateReportDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};

      final vehicle = json['vehicle'] as String? ?? '';
      final channel = json['channel'] as String? ?? '';
      final device = json['device'] as String? ?? '';
      final geolocationData =
          json['geolocation'] as Map<String, dynamic>? ?? {};

      if (vehicle.isEmpty) {
        errors['vehicle'] = ['Vehicle is required'];
      }

      if (channel.isEmpty) {
        errors['channel'] = ['Channel is required'];
      }

      if (device.isEmpty) {
        errors['device'] = ['Device is required'];
      }

      if (geolocationData.isNotEmpty) {
        final geolocationValidated = Geolocation.validated(geolocationData);
        if (geolocationValidated.isLeft) {
          errors['geolocation'] = ['Geolocation data is invalid'];
        }
      }

      if (errors.isEmpty) return Right(CreateReportDto.fromJson(json));
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
