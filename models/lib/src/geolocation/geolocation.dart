import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation.freezed.dart';
part 'geolocation.g.dart';

/// {@template geolocation}
/// Geolocation description
/// {@endtemplate}
@freezed
class Geolocation with _$Geolocation {
  /// {@macro geolocation}
  const factory Geolocation({
    required double lat,
    required double long,
  }) = _Geolocation;

  /// Creates a Geolocation from Json map
  factory Geolocation.fromJson(Map<String, dynamic> data) =>
      _$GeolocationFromJson(data);

  /// Validate json [Map]
  static Either<ValidationFailure, Geolocation> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};

      final lat = num.tryParse('${json['lat']}');
      final long = num.tryParse('${json['long']}');

      if (lat == null) {
        errors['lat'] = ['Lat is required'];
      }

      if (long == null) {
        errors['long'] = ['Lat is required'];
      }

      if (errors.isEmpty) return Right(Geolocation.fromJson(json));
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
