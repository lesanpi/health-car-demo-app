/// {@template failures}
/// Failure abstract representations
/// {@endtemplate}
abstract class Failure {
  /// Failure message
  String get message;

  /// Failure status code
  int get statusCode;
}
