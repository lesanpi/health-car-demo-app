// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReportDtoImpl _$$CreateReportDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReportDtoImpl(
      vehicle: json['vehicle'] as String,
      mileage: (json['mileage'] as num).toInt(),
      channel: json['channel'] as String? ?? '',
      device: json['device'] as String? ?? '',
      geolocation: json['geolocation'] == null
          ? null
          : Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateReportDtoImplToJson(
        _$CreateReportDtoImpl instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'mileage': instance.mileage,
      'channel': instance.channel,
      'device': instance.device,
      'geolocation': instance.geolocation?.toJson(),
    };
