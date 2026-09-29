import 'package:instock/db/app_database.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
  ProductDao(this._database);

  final AppDatabase _database;

  Future<List<Product>> findAll({DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'products',
        orderBy: 'preset_name COLLATE NOCASE ASC',
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<List<Product>> findByState(
    ProductState state, {
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'products',
        where: 'state = ?',
        whereArgs: [_stateToString(state)],
        orderBy: 'preset_name COLLATE NOCASE ASC',
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<List<Product>> findFinishedUpdatedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
    DatabaseExecutor? db,
  }) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'products',
        where: 'state = ? AND updated_at >= ? AND updated_at <= ?',
        whereArgs: [
          _stateToString(ProductState.finished),
          startInclusive.millisecondsSinceEpoch,
          endInclusive.millisecondsSinceEpoch,
        ],
        orderBy: 'updated_at DESC',
      );
      return rows.map(_mapRow).toList();
    });
  }

  Future<Product?> findById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final rows = await executor.query(
        'products',
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

  Future<void> upsert(Product product, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      final row = _toRow(product);
      final updated = await executor.update(
        'products',
        row,
        where: 'id = ?',
        whereArgs: [product.id],
      );
      if (updated == 0) {
        await executor.insert('products', row);
      }
    });
  }

  Future<void> deleteById(String id, {DatabaseExecutor? db}) {
    return _database.withExecutor(db, (executor) async {
      await executor.delete(
        'products',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Product _mapRow(Map<String, Object?> row) {
    return Product(
      id: row['id']! as String,
      state: _parseState(row['state']! as String),
      presetId: row['preset_id']! as String,
      presetName: row['preset_name']! as String,
      presetDescription: row['preset_description']! as String,
      customer: row['customer']! as String,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        (row['updated_at']! as num).toInt(),
      ),
    );
  }

  Map<String, Object?> _toRow(Product product) {
    return {
      'id': product.id,
      'state': _stateToString(product.state),
      'preset_id': product.presetId,
      'preset_name': product.presetName,
      'preset_description': product.presetDescription,
      'customer': product.customer,
      'updated_at': product.updatedAt.millisecondsSinceEpoch,
    };
  }

  ProductState _parseState(String value) {
    return ProductState.values.byName(value);
  }

  String _stateToString(ProductState state) => state.name;
}
