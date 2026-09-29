import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lint_rules/layer_import_rules.dart';

void main() {
  group('denialsForFile mapping', () {
    test('domain / data / persistence / infra deny-lists', () {
      expect(
        denialsForFile('/proj/lib/domain/entities/material.dart'),
        denyListForDomain,
      );
      expect(
        denialsForFile('/proj/lib/repo/material_repository_impl.dart'),
        denyListForDataAccess,
      );
      expect(
        denialsForFile('/proj/lib/db/daos/material_dao.dart'),
        denyListForPersistence,
      );
      expect(
        denialsForFile('/proj/lib/platform/material_image_service_impl.dart'),
        denyListForInfra,
      );
    });

    test('shared components use component deny-list', () {
      expect(
        denialsForFile('/proj/lib/screens/components/app_card.dart'),
        denyListForComponent,
      );
    });

    test('controllers deny repo, db, go_router, and infra plugins', () {
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_bloc.dart'),
        denyListForController,
      );
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_event.dart'),
        denyListForController,
      );
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_state.dart'),
        denyListForController,
      );
      expect(
        denyListForController,
        containsAll([
          'package:instock/repo/',
          'package:instock/db/',
          'package:go_router/',
          ...infrastructurePlugins,
        ]),
      );
      expect(
        infrastructurePlugins,
        containsAll([
          'package:sqflite/',
          'package:http/',
          'package:path_provider/',
          'package:image_picker/',
          'package:shared_preferences/',
        ]),
      );
    });

    test('views and other presentation helpers share view deny-list', () {
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_view.dart'),
        denyListForView,
      );
      expect(
        denialsForFile('/proj/lib/screens/inventory/open_material_sheet.dart'),
        denyListForView,
      );
      expect(
        denialsForFile('/proj/lib/screens/products/pick_material_sheet.dart'),
        denyListForView,
      );
      expect(
        denialsForFile(
          '/proj/lib/screens/workshop/widgets/product_status_chip.dart',
        ),
        denyListForView,
      );
      expect(
        denialsForFile('/proj/lib/screens/errors/ui_error_codes.dart'),
        denyListForView,
      );
    });

    test('generated presentation files are unrestricted', () {
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_event.freezed.dart'),
        isEmpty,
      );
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_state.freezed.dart'),
        isEmpty,
      );
      expect(
        denialsForFile('/proj/lib/screens/home/home/home_state.g.dart'),
        isEmpty,
      );
    });
  });

  test('no denied layer imports under lib/', () {
    final libDir = Directory('${Directory.current.path}/lib');
    expect(libDir.existsSync(), isTrue, reason: 'lib/ directory not found');

    final violations = <String>[];

    for (final file in libDir.listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) {
        continue;
      }

      final denials = denialsForFile(file.path);
      if (denials.isEmpty) {
        continue;
      }

      final lines = file.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        final uri = _extractImportUri(lines[i]);
        if (uri == null) {
          continue;
        }

        for (final denial in denials) {
          if (importMatchesDenial(uri, denial)) {
            violations.add('${file.path}:${i + 1}: $uri (denied: $denial)');
          }
        }
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'Layer import violations:\n${violations.join('\n')}',
    );
  });
}

String? _extractImportUri(String line) {
  final trimmed = line.trim();
  if (!trimmed.startsWith('import ') && !trimmed.startsWith('export ')) {
    return null;
  }

  final quoteStart = trimmed.indexOf("'");
  final doubleQuoteStart = trimmed.indexOf('"');
  final start = quoteStart >= 0
      ? quoteStart
      : doubleQuoteStart >= 0
          ? doubleQuoteStart
          : -1;
  if (start < 0) {
    return null;
  }

  final quote = trimmed[start];
  final end = trimmed.indexOf(quote, start + 1);
  if (end < 0) {
    return null;
  }

  return trimmed.substring(start + 1, end);
}
