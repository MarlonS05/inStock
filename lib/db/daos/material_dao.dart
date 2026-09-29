import 'package:instock/db/app_database.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:sqflite/sqflite.dart';

class MaterialDao {
  MaterialDao(this._database);

  final AppDatabase _database;

  Future<List<Material>> findAll({DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'materials',
        orderBy: 'title COLLATE NOCASE ASC',
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<Material?> findById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'materials',
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

  Future<void> upsert(Material material, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final row = _toRow(material);
      final updated = await executor.update(
        'materials',
        row,
        where: 'id = ?',
        whereArgs: [material.id],
      );
      if (updated == 0) {
        await executor.insert('materials', row);
      }
    });
  }

  Future<void> deleteById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'materials',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Material _mapRow(Map<String, Object?> row) {
    return Material(
      id: row['id']! as String,
      title: row['title']! as String,
      description: row['description']! as String,
      quantity: (row['quantity']! as num).toDouble(),
      image: row['image'] as String?,
    );
  }

  Map<String, Object?> _toRow(Material material) {
    return {
      'id': material.id,
      'title': material.title,
      'description': material.description,
      'quantity': material.quantity,
      'image': material.image,
    };
  }
}
