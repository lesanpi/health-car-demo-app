import 'dart:io';

import 'package:exceptions/exceptions.dart';

/// {@template server_exception}
/// Exception that occurs on server side
/// {@endtemplate}
class InternalServerException extends HttpException {
  /// {@macro server_exception}
  InternalServerException(String message)
      : super(message, HttpStatus.internalServerError);
}
