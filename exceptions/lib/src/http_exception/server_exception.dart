import 'dart:io';

import 'package:exceptions/exceptions.dart';

/// {@template server_exception}
/// Exception that occurs on server side
/// {@endtemplate}
class ServerException extends HttpException {
  /// {@macro server_exception}
  ServerException(String message)
      : super(message, HttpStatus.internalServerError);
}
