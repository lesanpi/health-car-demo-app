export 'network_failure/network_failure.dart';
export 'request_failure/request_failure.dart';
export 'server_failure/server_failure.dart';
export 'validation_failure/validation_failure.dart';

/// {@template failures}
/// Failure abstract representations
/// {@endtemplate}
abstract class Failure {
  /// Failure message
  String get message;

  /// Failure status code
  int get statusCode;
}
