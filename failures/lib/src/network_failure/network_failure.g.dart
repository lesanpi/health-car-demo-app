// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkFailureImpl _$$NetworkFailureImplFromJson(Map<String, dynamic> json) =>
    _$NetworkFailureImpl(
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NetworkFailureImplToJson(
        _$NetworkFailureImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errors': instance.errors,
    };
