/// Stable, non-user-facing error codes carried on screen state.
///
/// Views map these to [AppLocalizations] in `BlocListener`s. Do not put
/// English copy or `Exception.toString()` into state.
abstract final class UiErrorCodes {
  static const loadFailure = 'load_failure';
  static const actionFailure = 'action_failure';
  static const createFailure = 'create_failure';
  static const notFound = 'not_found';
  static const materialInUse = 'material_in_use';
  static const finishFailure = 'finish_failure';
  static const seedFailure = 'seed_failure';
  static const wipeFailure = 'wipe_failure';
  static const purchaseFailure = 'purchase_failure';
  static const databaseOpenFailure = 'database_open_failure';
}
