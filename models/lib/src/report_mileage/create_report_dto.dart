import 'package:freezed_annotation/freezed_annotation.dart';
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
}
