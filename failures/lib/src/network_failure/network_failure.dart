import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';
part 'network_failure.g.dart';

/// {@template network_failure}
/// NetworkFailure description
/// {@endtemplate}
@freezed
class NetworkFailure with _$NetworkFailure {
  /// {@macro network_failure}
  const factory NetworkFailure({
    required String message,
    required int statusCode,
    @Default([]) List<String> errors,
  }) = _NetworkFailure;

  /// Creates a NetworkFailure from Json map
  factory NetworkFailure.fromJson(Map<String, dynamic> data) =>
      _$NetworkFailureFromJson(data);
}
