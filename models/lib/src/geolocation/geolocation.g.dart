// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeolocationImpl _$$GeolocationImplFromJson(Map<String, dynamic> json) =>
    _$GeolocationImpl(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$$GeolocationImplToJson(_$GeolocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
