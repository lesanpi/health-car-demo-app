// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_mileage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportMileageImpl _$$ReportMileageImplFromJson(Map<String, dynamic> json) =>
    _$ReportMileageImpl(
      id: json['id'] as String,
      vehicle: json['vehicle'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
      geolocation: json['geolocation'] == null
          ? null
          : Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
      mileage: (json['mileage'] as num?)?.toInt() ?? 0,
      channel: json['channel'] as String? ?? '',
      device: json['device'] as String? ?? '',
    );

Map<String, dynamic> _$$ReportMileageImplToJson(_$ReportMileageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle': instance.vehicle,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'geolocation': instance.geolocation,
      'mileage': instance.mileage,
      'channel': instance.channel,
      'device': instance.device,
    };
