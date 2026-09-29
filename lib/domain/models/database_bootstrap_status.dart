/// Result of opening the local database during app startup.
class DatabaseBootstrapStatus {
  const DatabaseBootstrapStatus._({required this.isReady, this.cause});

  const DatabaseBootstrapStatus.ready() : this._(isReady: true);

  const DatabaseBootstrapStatus.failed(Object cause)
      : this._(isReady: false, cause: cause);

  final bool isReady;
  final Object? cause;
}
