import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// {@template unimplemented_handler}
/// This is the unimplemented handler
/// It handles all the requests that are not implemented
/// {@endtemplate}

Future<Response> unimplementedHandler([RequestContext? context]) async {
  return Response.json(
    body: {'error': '👀 Not implemented yet'},
    statusCode: HttpStatus.notImplemented,
  );
}

/// {@template unauthorizedHandler}
/// This is the unauthorized handler
/// It handles all the requests that are not unauthorized
/// {@endtemplate}
Future<Response> unauthorizedHandler([RequestContext? context]) async {
  return Response.json(
    body: {'error': '🔐 Unauthorized user'},
    statusCode: HttpStatus.unauthorized,
  );
}
