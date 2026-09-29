/// Opens, wipes, and recreates the local SQLite database.
abstract class DatabaseMaintenanceRepository {
  /// Attempts to open the database again (same path as the last open attempt).
  Future<void> retryOpen();

  Future<void> wipeAndRecreate();
}
