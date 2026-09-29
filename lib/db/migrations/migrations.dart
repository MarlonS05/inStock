import 'package:instock/db/schema/tables.dart';
import 'package:sqflite/sqflite.dart';

/// Runs incremental schema upgrades. Version 1 creates the current schema.
Future<void> runMigrations(Database db, int oldVersion, int newVersion) async {
  if (oldVersion >= newVersion) {
    return;
  }

  for (var version = oldVersion + 1; version <= newVersion; version++) {
    await _migrateToVersion(db, version);
  }
}

Future<void> _migrateToVersion(Database db, int version) async {
  switch (version) {
    case 1:
      for (final statement in createSchemaStatements) {
        await db.execute(statement);
      }
      return;
    default:
      throw StateError('Unknown database migration version: $version');
  }
}
