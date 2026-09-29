import 'package:instock/db/app_database.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:sqflite/sqflite.dart';

class PresetDao {
  PresetDao(this._database);

  final AppDatabase _database;

  Future<List<Preset>> findAll({DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'presets',
        orderBy: 'name COLLATE NOCASE ASC',
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<Preset?> findById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'presets',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );
      if (rows.isEmpty) {
        return null;
      }
      return _mapRow(rows.first);
    });
  }

  Future<void> upsert(Preset preset, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final row = _toRow(preset);
      final updated = await executor.update(
        'presets',
        row,
        where: 'id = ?',
        whereArgs: [preset.id],
      );
      if (updated == 0) {
        await executor.insert('presets', row);
      }
    });
  }

  Future<void> deleteById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'presets',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Preset _mapRow(Map<String, Object?> row) {
    return Preset(
      id: row['id']! as String,
      name: row['name']! as String,
      description: row['description']! as String,
      image: row['image'] as String?,
    );
  }

  Map<String, Object?> _toRow(Preset preset) {
    return {
      'id': preset.id,
      'name': preset.name,
      'description': preset.description,
      'image': preset.image,
    };
  }
}
