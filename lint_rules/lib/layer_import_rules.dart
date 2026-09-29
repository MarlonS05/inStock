/// Path-keyed deny-lists for inStock layer import boundaries.
///
/// Keep in sync with docs/architecture.md and test/architecture/layer_import_test.dart.
library;

const denyListForDomain = [
  'package:flutter/',
  'package:flutter_bloc/',
  'package:go_router/',
  'package:instock/screens/',
  'package:instock/repo/',
  'package:instock/db/',
  'package:instock/platform/',
  'package:instock/router/',
  'package:instock/di/',
  'package:instock/theme/',
];

const denyListForDataAccess = [
  'package:flutter/',
  'package:flutter_bloc/',
  'package:go_router/',
  'package:instock/screens/',
  'package:instock/router/',
  'package:instock/di/',
];

const denyListForPersistence = [
  'package:flutter/',
  'package:flutter_bloc/',
  'package:go_router/',
  'package:instock/screens/',
  'package:instock/repo/',
  'package:instock/router/',
  'package:instock/di/',
];

const denyListForInfra = [
  'package:flutter_bloc/',
  'package:go_router/',
  'package:instock/screens/',
  'package:instock/repo/',
  'package:instock/db/',
  'package:instock/router/',
  'package:instock/di/',
];

const denyListForView = [
  'package:instock/repo/',
  'package:instock/db/',
  'package:instock/router/',
  'package:instock/di/',
  'package:go_router/',
];

/// OS / plugin packages that must stay out of controllers (BLoC / event / state).
///
/// Reach these only through domain ports implemented in `lib/platform/` /
/// `lib/repo/`. Keep in sync with docs/architecture.md.
const infrastructurePlugins = [
  'package:sqflite/',
  'package:http/',
  'package:path_provider/',
  'package:image_picker/',
  'package:shared_preferences/',
];

const denyListForController = [
  'package:instock/repo/',
  'package:instock/db/',
  'package:go_router/',
  ...infrastructurePlugins,
];

const denyListForComponent = [
  'package:flutter_bloc/',
  'package:go_router/',
  'package:instock/repo/',
  'package:instock/db/',
  'package:instock/router/',
  'package:instock/di/',
];

/// Returns import URI prefixes that [filePath] must not contain.
List<String> denialsForFile(String filePath) {
  final normalized = filePath.replaceAll('\\', '/');

  if (normalized.contains('/lib/domain/')) {
    return denyListForDomain;
  }
  if (normalized.contains('/lib/repo/')) {
    return denyListForDataAccess;
  }
  if (normalized.contains('/lib/db/')) {
    return denyListForPersistence;
  }
  if (normalized.contains('/lib/platform/')) {
    return denyListForInfra;
  }
  if (normalized.contains('/lib/screens/components/')) {
    return denyListForComponent;
  }
  if (_isPresentationFile(normalized)) {
    if (_isGeneratedPresentationFile(normalized)) {
      return const [];
    }
    if (normalized.endsWith('_bloc.dart') ||
        normalized.endsWith('_event.dart') ||
        normalized.endsWith('_state.dart')) {
      return denyListForController;
    }
    // Views (`*_view.dart`) and other presentation helpers under screens/
    // (e.g. errors/) share view denials so helpers cannot bypass router / DI /
    // go_router gates.
    return denyListForView;
  }

  return const [];
}

bool _isPresentationFile(String path) {
  return path.contains('/lib/screens/');
}

bool _isGeneratedPresentationFile(String path) {
  return path.endsWith('.freezed.dart') || path.endsWith('.g.dart');
}

/// Returns true when [importUri] matches a denied [denialPrefix].
bool importMatchesDenial(String importUri, String denialPrefix) {
  return importUri.startsWith(denialPrefix);
}
