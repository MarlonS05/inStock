abstract interface class DatabaseSeederRepository {
  /// Deletes all inventory rows and inserts predefined dummy base entities.
  Future<void> seedBaseData();
}
