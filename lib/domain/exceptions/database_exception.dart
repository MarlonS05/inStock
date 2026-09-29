/// Thrown when a SQLite / persistence operation fails.
class DatabaseException implements Exception {
  DatabaseException(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => 'DatabaseException: $message';
}
