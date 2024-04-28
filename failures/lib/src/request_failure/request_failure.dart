import 'dart:io';

import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_failure.freezed.dart';
part 'request_failure.g.dart';

/// {@template request_failure}
/// RequestFailure description
/// {@endtemplate}
@freezed
class RequestFailure extends Failure with _$RequestFailure {
  /// {@macro request_failure}
  const factory RequestFailure({
    required String message,
    @Default(HttpStatus.badRequest) int statusCode,
  }) = _RequestFailure;

  /// Creates a RequestFailure from Json map
  factory RequestFailure.fromJson(Map<String, dynamic> data) =>
      _$RequestFailureFromJson(data);
}
