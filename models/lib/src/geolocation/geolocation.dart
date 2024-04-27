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
}
