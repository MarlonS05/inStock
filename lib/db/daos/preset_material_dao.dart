import 'package:instock/db/app_database.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:sqflite/sqflite.dart';

class PresetMaterialDao {
  PresetMaterialDao(this._database);

  final AppDatabase _database;

  Future<List<PresetMaterial>> findByPresetId(
    String presetId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'preset_materials',
        where: 'preset_id = ?',
        whereArgs: [presetId],
      );
      return rows.map(_mapRow).toList();
    });
  }

  /// BOM line counts keyed by preset_id.
  Future<Map<String, int>> countByPresetId({DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.rawQuery(
        '''
      SELECT preset_id AS preset_id, COUNT(*) AS material_count
      FROM preset_materials
      GROUP BY preset_id
      ''',
      );
      return {
        for (final row in rows)
          row['preset_id']! as String: row['material_count']! as int,
      };
    });
  }

  Future<PresetMaterial?> findById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'preset_materials',
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

  Future<void> upsert(PresetMaterial line, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final row = _toRow(line);
      final updated = await executor.update(
        'preset_materials',
        row,
        where: 'id = ?',
        whereArgs: [line.id],
      );
      if (updated == 0) {
        await executor.insert('preset_materials', row);
      }
    });
  }

  Future<void> deleteById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'preset_materials',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Future<void> deleteByMaterialId(
    String materialId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'preset_materials',
        where: 'material_id = ?',
        whereArgs: [materialId],
      );
    });
  }

  PresetMaterial _mapRow(Map<String, Object?> row) {
    return PresetMaterial(
      id: row['id']! as String,
      materialId: row['material_id']! as String,
      presetId: row['preset_id']! as String,
      quantity: (row['quantity']! as num).toDouble(),
    );
  }

  Map<String, Object?> _toRow(PresetMaterial line) {
    return {
      'id': line.id,
      'material_id': line.materialId,
      'preset_id': line.presetId,
      'quantity': line.quantity,
    };
  }
}
