import 'package:instock/db/app_database.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:sqflite/sqflite.dart';

class UsedMaterialDao {
  UsedMaterialDao(this._database);

  final AppDatabase _database;

  Future<List<UsedMaterial>> findByProductId(
    String productId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'used_materials',
        where: 'product_id = ?',
        whereArgs: [productId],
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<List<UsedMaterial>> findByProductIds(
    List<String> productIds, {
    DatabaseExecutor? db,
  }) {
    if (productIds.isEmpty) {
      return Future.value(const []);
    }
    return _database.withExecutor(db, (executor) async {
      final placeholders = List.filled(productIds.length, '?').join(',');
      final rows = await executor.query(
        'used_materials',
        where: 'product_id IN ($placeholders)',
        whereArgs: productIds,
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<double> sumReservedQuantityForMaterial(
    String materialId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.rawQuery(
        '''
      SELECT COALESCE(SUM(um.quantity), 0) AS reserved
      FROM used_materials um
      INNER JOIN products p ON p.id = um.product_id
      WHERE um.material_id = ? AND p.state = ?
      ''',
        [materialId, ProductState.workbench.name],
      );
      return (rows.first['reserved']! as num).toDouble();
    });
  }

  /// Reserved quantities keyed by material_id for active workbench products.
  Future<Map<String, double>> sumReservedQuantitiesByMaterialId({
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.rawQuery(
        '''
      SELECT um.material_id AS material_id,
             COALESCE(SUM(um.quantity), 0) AS reserved
      FROM used_materials um
      INNER JOIN products p ON p.id = um.product_id
      WHERE p.state = ?
      GROUP BY um.material_id
      ''',
        [ProductState.workbench.name],
      );
      return {
        for (final row in rows)
          row['material_id']! as String: (row['reserved']! as num).toDouble(),
      };
    });
  }

  Future<bool> existsForMaterial(
    String materialId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'used_materials',
        columns: ['id'],
        where: 'material_id = ?',
        whereArgs: [materialId],
        limit: 1,
      );
      return rows.isNotEmpty;
    });
  }

  Future<void> upsert(UsedMaterial usedMaterial, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final row = _toRow(usedMaterial);
      final updated = await executor.update(
        'used_materials',
        row,
        where: 'id = ?',
        whereArgs: [usedMaterial.id],
      );
      if (updated == 0) {
        await executor.insert('used_materials', row);
      }
    });
  }

  Future<void> deleteById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'used_materials',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Future<void> deleteByProductId(
    String productId, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'used_materials',
        where: 'product_id = ?',
        whereArgs: [productId],
      );
    });
  }

  UsedMaterial _mapRow(Map<String, Object?> row) {
    return UsedMaterial(
      id: row['id']! as String,
      productId: row['product_id']! as String,
      materialId: row['material_id']! as String,
      quantity: (row['quantity']! as num).toDouble(),
    );
  }

  Map<String, Object?> _toRow(UsedMaterial usedMaterial) {
    return {
      'id': usedMaterial.id,
      'product_id': usedMaterial.productId,
      'material_id': usedMaterial.materialId,
      'quantity': usedMaterial.quantity,
    };
  }
}
