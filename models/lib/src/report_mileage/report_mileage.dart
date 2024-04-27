import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/geolocation/geolocation.dart';
import 'package:models/src/serializers/date_time_converter.dart';

part 'report_mileage.freezed.dart';
part 'report_mileage.g.dart';

/// {@template report_mileage}
/// ReportMileage description
/// {@endtemplate}
@freezed
class ReportMileage with _$ReportMileage {
  /// {@macro report_mileage}
  const factory ReportMileage({
    required String id,
    required String vehicle,
    @DateTimeConverter() required DateTime createdAt,
    Geolocation? geolocation,
    @Default(0) int mileage,
    @Default('') String channel,
    @Default('') String device,
  }) = _ReportMileage;

  /// Creates a ReportMileage from Json map
  factory ReportMileage.fromJson(Map<String, dynamic> data) =>
      _$ReportMileageFromJson(data);
}
