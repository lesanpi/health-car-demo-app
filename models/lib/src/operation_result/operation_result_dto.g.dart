// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationResultDtoImpl _$$OperationResultDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationResultDtoImpl(
      success: json['success'] as bool,
      message: json['message'] as String? ?? null,
    );

Map<String, dynamic> _$$OperationResultDtoImplToJson(
        _$OperationResultDtoImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
