import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

/// {@template database_connection}
/// DatabaseConnection representation
/// {@endtemplate}
class DatabaseConnection {
  /// {@macro database_connection}
  DatabaseConnection({
    required this.dbUrl,
  });

  /// Database Url
  final String dbUrl;

  Db? _connection;

  /// Database connection
  Db get db =>
      _connection ??= throw Exception('Database connection not initialized');

  /// Open connection to database
  Future<void> connect() async {
    try {
      _connection = await Db.create(
        dbUrl,
      );
      await _connection!.open();
      print('Database connection successful');
    } catch (e, s) {
      print(
        'Database connection failed: $e',
      );
    }
  }

  /// Close connection
  Future<void> close() async {
    await _connection?.close();
  }
}
