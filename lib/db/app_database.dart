import 'package:instock/db/database_guard.dart';
import 'package:instock/db/migrations/migrations.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

/// SQLite connection handle — version, transactions, and schema lifecycle.
class AppDatabase {
  static const version = 1;

  Database? _database;
  String? _path;

  bool get isOpen => _database?.isOpen ?? false;

  Future<Database> get database async {
    final db = _database;
    if (db != null && db.isOpen) {
      return db;
    }
    return open();
  }

  Future<Database> open({String? pathOverride}) async {
    return guardDatabaseOpen(() async {
      final existing = _database;
      if (existing != null && existing.isOpen) {
        return existing;
      }

      final path =
          pathOverride ??
          _path ??
          p.join(await getDatabasesPath(), 'instock.db');
      _path = path;
      _database = await openDatabase(
        path,
        version: version,
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) async {
          await runMigrations(db, 0, version);
        },
        onUpgrade: runMigrations,
      );
      return _database!;
    });
  }

  /// Closes the connection, deletes the database file, and reopens so schema
  /// is rebuilt via migrations from version 0.
  Future<void> wipeAndRecreate({String? pathOverride}) async {
    return guardDatabaseOpen(() async {
      await close();
      final path =
          pathOverride ??
          _path ??
          p.join(await getDatabasesPath(), 'instock.db');
      await deleteDatabase(path);
      await open(pathOverride: path);
    });
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  /// Runs [action] with an open [Database], wrapping failures as
  /// [DatabaseException].
  Future<T> withDb<T>(Future<T> Function(Database db) action) {
    return guardDatabase(() async {
      final db = await database;
      return action(db);
    });
  }

  /// Uses [db] when provided (e.g. inside a transaction); otherwise
  /// [withDb].
  Future<T> withExecutor<T>(
    DatabaseExecutor? db,
    Future<T> Function(DatabaseExecutor executor) action,
  ) {
    if (db != null) {
      return action(db);
    }
    return withDb(action);
  }

  Future<T> transaction<T>(Future<T> Function(Transaction txn) action) {
    return guardDatabase(() async {
      final db = await database;
      return db.transaction(action);
    });
  }
}
