// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestFailureImpl _$$RequestFailureImplFromJson(Map<String, dynamic> json) =>
    _$RequestFailureImpl(
      message: json['message'] as String,
      statusCode:
          (json['statusCode'] as num?)?.toInt() ?? HttpStatus.badRequest,
    );

Map<String, dynamic> _$$RequestFailureImplToJson(
        _$RequestFailureImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
