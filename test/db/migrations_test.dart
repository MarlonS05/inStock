import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:instock/db/app_database.dart';
import 'package:instock/db/migrations/migrations.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('open creates v1 schema with current tables and indexes', () async {
    final path = p.join(
      Directory.systemTemp.path,
      'instock_fresh_v1_${DateTime.now().microsecondsSinceEpoch}.db',
    );
    addTearDown(() {
      final file = File(path);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });

    final appDatabase = AppDatabase();
    await appDatabase.open(pathOverride: path);
    final db = await appDatabase.database;

    expect(
      await _tableNames(db),
      containsAll([
        'materials',
        'presets',
        'preset_materials',
        'products',
        'used_materials',
      ]),
    );
    expect(await _tableNames(db), isNot(contains('product_presets')));
    expect(await _tableNames(db), isNot(contains('product_materials')));
    expect(await _indexNames(db), containsAll(_expectedV1Indexes));
    expect(await db.getVersion(), AppDatabase.version);

    await appDatabase.close();
  });

  test(
    'wipeAndRecreate deletes data and rebuilds schema via migrations',
    () async {
      final path = p.join(
        Directory.systemTemp.path,
        'instock_wipe_${DateTime.now().microsecondsSinceEpoch}.db',
      );
      addTearDown(() {
        final file = File(path);
        if (file.existsSync()) {
          file.deleteSync();
        }
      });

      final appDatabase = AppDatabase();
      await appDatabase.open(pathOverride: path);
      final db = await appDatabase.database;
      await db.insert('materials', {
        'id': 'mat-1',
        'title': 'Oak',
        'description': 'Board',
        'quantity': 10,
        'image': null,
      });
      expect(await db.query('materials'), hasLength(1));

      await appDatabase.wipeAndRecreate(pathOverride: path);
      final wiped = await appDatabase.database;

      expect(await wiped.query('materials'), isEmpty);
      expect(
        await _tableNames(wiped),
        containsAll([
          'materials',
          'presets',
          'preset_materials',
          'products',
          'used_materials',
        ]),
      );
      expect(await _indexNames(wiped), containsAll(_expectedV1Indexes));
      expect(await wiped.getVersion(), AppDatabase.version);

      await appDatabase.close();
    },
  );

  test(
    'retry open retains original pathOverride after a failed open',
    () async {
      final path = p.join(
        Directory.systemTemp.path,
        'instock_retry_path_${DateTime.now().microsecondsSinceEpoch}.db',
      );
      addTearDown(() {
        final file = File(path);
        if (file.existsSync()) {
          file.deleteSync();
        }
      });

      // Create a directory at the DB path so the first open fails.
      await Directory(path).create(recursive: true);
      final appDatabase = AppDatabase();
      await expectLater(
        appDatabase.open(pathOverride: path),
        throwsA(isA<Object>()),
      );

      await Directory(path).delete(recursive: true);

      // Retry without pathOverride — must reuse the retained override path.
      await appDatabase.open();
      final db = await appDatabase.database;
      expect(db.path, path);
      expect(await db.getVersion(), AppDatabase.version);

      await appDatabase.close();
    },
  );

  test('runMigrations is a no-op when already at target version', () async {
    final db = await databaseFactory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(version: 1, onCreate: (_, _) async {}),
    );
    await runMigrations(db, 1, 1);
    await db.close();
  });

  test('runMigrations from 0 creates v1 schema', () async {
    final db = await databaseFactory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(version: 1, onCreate: (_, _) async {}),
    );
    await runMigrations(db, 0, 1);
    expect(
      await _tableNames(db),
      containsAll([
        'materials',
        'presets',
        'preset_materials',
        'products',
        'used_materials',
      ]),
    );
    expect(await _indexNames(db), containsAll(_expectedV1Indexes));
    await db.close();
  });
}

const _expectedV1Indexes = [
  'idx_used_materials_material_id',
  'idx_used_materials_product_id',
  'idx_preset_materials_preset_id',
  'idx_products_state_updated_at',
];

Future<Set<String>> _indexNames(Database db) async {
  final rows = await db.rawQuery(
    "SELECT name FROM sqlite_master WHERE type = 'index' AND name LIKE 'idx_%'",
  );
  return {for (final row in rows) row['name']! as String};
}

Future<Set<String>> _tableNames(Database db) async {
  final rows = await db.rawQuery(
    "SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%'",
  );
  return {for (final row in rows) row['name']! as String};
}
