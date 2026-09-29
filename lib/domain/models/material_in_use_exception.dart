/// Thrown when a material cannot be deleted because it is reserved on the
/// workbench.
class MaterialInUseException implements Exception {
  MaterialInUseException({required this.materialId});

  final String materialId;

  @override
  String toString() => 'MaterialInUseException(materialId: $materialId)';
}
