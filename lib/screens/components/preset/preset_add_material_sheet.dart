import 'package:flutter/material.dart';
import 'package:instock/domain/entities/material.dart' as domain;
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/theme/app_theme.dart';

Future<void> showPresetAddMaterialSheet({
  required BuildContext context,
  required List<domain.Material> materials,
  required ValueChanged<domain.Material> onMaterialSelected,
  String? title,
  String? emptyMessage,
}) {
  final l10n = AppLocalizations.of(context);

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (sheetContext) {
      return _PresetAddMaterialSheet(
        title: title ?? l10n.productsAddMaterialTitle,
        emptyMessage: emptyMessage ?? l10n.productsAddMaterialEmpty,
        materials: materials,
        onMaterialSelected: (material) {
          onMaterialSelected(material);
          // Local sheet dismiss only — route-level nav is BLoC-owned.
          Navigator.of(sheetContext).pop();
        },
      );
    },
  );
}

class _PresetAddMaterialSheet extends StatelessWidget {
  const _PresetAddMaterialSheet({
    required this.title,
    required this.emptyMessage,
    required this.materials,
    required this.onMaterialSelected,
  });

  final String title;
  final String emptyMessage;
  final List<domain.Material> materials;
  final ValueChanged<domain.Material> onMaterialSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.md + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (materials.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Text(
                emptyMessage,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            )
          else
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: materials.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final material = materials[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      material.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: material.description.isEmpty
                        ? null
                        : Text(
                            material.description,
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                    trailing: Icon(
                      Icons.add_rounded,
                      color: scheme.primary,
                    ),
                    onTap: () => onMaterialSelected(material),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
