import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_result_dto.freezed.dart';
part 'operation_result_dto.g.dart';

/// {@template operationResult}
/// Operation Result description
/// {@endtemplate}
@freezed
class OperationResultDto with _$OperationResultDto {
  /// {@macro operationResult}
  const factory OperationResultDto({
    required bool success,
    @Default(null) String? message,
  }) = _OperationResultDto;

  /// Creates a operation from Json map
  factory OperationResultDto.fromJson(Map<String, dynamic> json) =>
      _$OperationResultDtoFromJson(json);
}
