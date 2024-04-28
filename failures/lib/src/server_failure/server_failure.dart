import 'dart:io';

import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_failure.freezed.dart';

/// {@template server_failure}
/// ServerFailure
/// {@endtemplate}
@freezed
class ServerFailure extends Failure with _$ServerFailure {
  /// {@macro server_failure}
  const factory ServerFailure({
    required String message,
    @Default(HttpStatus.internalServerError) int statusCode,
  }) = _ServerFailure;
}
