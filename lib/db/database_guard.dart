import 'package:instock/domain/exceptions/database_exception.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

/// Runs [action] and wraps SQLite failures as [DatabaseException].
///
/// Domain and other intentional exceptions propagate unchanged.
Future<T> guardDatabase<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on DatabaseException {
    rethrow;
  } on sqflite.DatabaseException catch (error, stackTrace) {
    Error.throwWithStackTrace(
      DatabaseException('Database operation failed', cause: error),
      stackTrace,
    );
  }
}

/// Like [guardDatabase], but also wraps unexpected non-domain errors (e.g.
/// path / IO failures during open).
Future<T> guardDatabaseOpen<T>(Future<T> Function() action) async {
  try {
    return await guardDatabase(action);
  } on DatabaseException {
    rethrow;
  } catch (error, stackTrace) {
    Error.throwWithStackTrace(
      DatabaseException('Database operation failed', cause: error),
      stackTrace,
    );
  }
}
