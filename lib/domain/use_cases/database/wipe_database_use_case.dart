import 'package:instock/domain/repositories/database_maintenance_repository.dart';

class WipeDatabaseUseCase {
  WipeDatabaseUseCase(this._repository);

  final DatabaseMaintenanceRepository _repository;

  Future<void> call() => _repository.wipeAndRecreate();
}
