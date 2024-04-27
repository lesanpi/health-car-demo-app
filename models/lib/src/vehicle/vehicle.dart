import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

/// {@template vehicle}
/// Vehicle description
/// {@endtemplate}
@freezed
class Vehicle with _$Vehicle {
  /// {@macro vehicle}
  const factory Vehicle({
    required String id,
    required String name,
    required String photo,
  }) = _Vehicle;

  /// Creates a Vehicle from Json map
  factory Vehicle.fromJson(Map<String, dynamic> data) =>
      _$VehicleFromJson(data);
}
