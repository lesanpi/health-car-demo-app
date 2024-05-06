/// {@template http_exception}
/// This is the base class for all http exceptions
/// Use this class to throw http exceptions
/// {@endtemplate}
abstract class HttpException implements Exception {
  /// {@macro http_exception}
  const HttpException(this.message, this.statusCode);

  /// Exception message
  final String message;

  /// HTTP Status code
  final int statusCode;

  @override
  String toString() => '$runtimeType: $message';
}

/// {@template http_failure_exception}
/// General http failure exception
/// {@endtemplate}
class HttpFailureException extends HttpException {
  /// {@macro http_failure_exception}
  const HttpFailureException(super.message, super.statusCode);
}
