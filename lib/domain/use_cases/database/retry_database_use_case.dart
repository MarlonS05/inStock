import 'package:instock/domain/repositories/database_maintenance_repository.dart';

class RetryDatabaseUseCase {
  RetryDatabaseUseCase(this._repository);

  final DatabaseMaintenanceRepository _repository;

  Future<void> call() => _repository.retryOpen();
}
