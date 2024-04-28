// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestFailure _$$_RequestFailureFromJson(Map<String, dynamic> json) =>
    _$_RequestFailure(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int? ?? HttpStatus.badRequest,
    );

Map<String, dynamic> _$$_RequestFailureToJson(_$_RequestFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
