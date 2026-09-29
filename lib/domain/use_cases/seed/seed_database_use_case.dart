import 'package:instock/domain/repositories/database_seeder_repository.dart';
import 'package:instock/domain/seed/dummy_seed_data.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';

class SeedDatabaseUseCase {
  SeedDatabaseUseCase(this._seederRepository, this._addToWorkbench);

  final DatabaseSeederRepository _seederRepository;
  final AddProductToWorkbenchUseCase _addToWorkbench;

  Future<void> call() async {
    await _seederRepository.seedBaseData();
    await _addToWorkbench(
      presetId: DummySeedData.workbenchPresetId,
      customer: DummySeedData.workbenchCustomer,
    );
  }
}
