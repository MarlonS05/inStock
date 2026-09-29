import 'package:instock/domain/entities/material.dart';

abstract interface class MaterialRepository {
  Future<List<Material>> getAll();

  Future<Material?> getById(String id);

  /// On-hand quantity minus amounts reserved on active workbench builds.
  Future<double> getAvailableQuantity(String materialId);

  /// Total quantity reserved across all active workbench builds.
  Future<double> getReservedQuantity(String materialId);

  /// Reserved qty per material_id for active workbench products only.
  Future<Map<String, double>> getReservedQuantitiesByMaterialId();

  Future<void> save(Material material);

  Future<void> delete(String id);
}
