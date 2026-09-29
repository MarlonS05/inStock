import 'package:instock/db/app_database.dart';
import 'package:instock/domain/repositories/database_maintenance_repository.dart';

class DatabaseMaintenanceRepositoryImpl
    implements DatabaseMaintenanceRepository {
  DatabaseMaintenanceRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<void> retryOpen() async {
    await _database.open();
  }

  @override
  Future<void> wipeAndRecreate() => _database.wipeAndRecreate();
}
