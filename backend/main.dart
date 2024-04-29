import 'dart:io';

import 'package:backend/db/database_connection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';

final env = DotEnv()..load(['variables.env']);
final _db = DatabaseConnection(dbUrl: env['DB_URL'] ?? '');

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // 1. Execute any custom code prior to starting the server...

  // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  print('Starting server...');
  try {
    await _db.connect();
    print('Server started succesfully');
    return serve(
      handler.use(databaseHandler()),
      ip,
      port,
    );
  } catch (e) {
    print('Error starting server... $e');
    rethrow;
  }
}

// handling the request for our database by reading it's context
Middleware databaseHandler() {
  return (handler) {
    return handler
        .use(requestLogger())
        .use(provider<DatabaseConnection>((_) => _db));
  };
}
