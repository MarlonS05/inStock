import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/models/theme_preset_id.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_surface.dart';
import 'package:instock/screens/settings/settings/settings_bloc.dart';
import 'package:instock/screens/settings/settings/settings_event.dart';
import 'package:instock/screens/settings/settings/settings_state.dart';
import 'package:instock/theme/app_locale_cubit.dart';
import 'package:instock/theme/app_locale_state.dart';
import 'package:instock/theme/app_theme.dart';
import 'package:instock/theme/app_theme_cubit.dart';
import 'package:instock/theme/app_theme_presets.dart';
import 'package:instock/theme/app_theme_state.dart';
import 'package:instock/domain/models/app_locale_option.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          (current.status == SettingsStatus.success ||
              current.status == SettingsStatus.failure),
      listener: (context, state) {
        final message = switch ((state.status, state.lastAction)) {
          (SettingsStatus.success, SettingsDevAction.seed) =>
            l10n.settingsSeedDatabaseSuccess,
          (SettingsStatus.failure, SettingsDevAction.seed) =>
            l10n.settingsSeedDatabaseFailure,
          (SettingsStatus.success, SettingsDevAction.wipe) =>
            l10n.settingsWipeDatabaseSuccess,
          (SettingsStatus.failure, SettingsDevAction.wipe) =>
            l10n.settingsWipeDatabaseFailure,
          _ => null,
        };
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      },
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.settingsTitle,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              LanguageCycleBox(l10n: l10n),
              const SizedBox(height: AppSpacing.lg),
              BlocBuilder<AppThemeCubit, AppThemeState>(
                builder: (context, themeState) {
                  return ThemePickerPanel(
                    l10n: l10n,
                    selected: themeState.preset,
                    onSelected: (preset) =>
                        context.read<AppThemeCubit>().selectPreset(preset),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              SettingsDeveloperPanel(l10n: l10n),
            ],
          ),
        ),
      ),
    );
  }
}

// --- folded from theme_preset_list_tile.dart ---

class ThemePresetListTile extends StatelessWidget {
  const ThemePresetListTile({
    super.key,
    required this.preset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final ThemePresetId preset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = themeDataForPreset(preset).colorScheme;
    final themeScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: Material(
        color: isSelected
            ? themeScheme.primary.withValues(alpha: 0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ColoredBox(color: scheme.primary),
                        ),
                        Expanded(child: ColoredBox(color: scheme.secondary)),
                        Expanded(child: ColoredBox(color: scheme.surface)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    label,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? themeScheme.primary
                          : themeScheme.onSurface,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: themeScheme.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// --- folded from theme_picker_panel.dart ---

class ThemePickerPanel extends StatelessWidget {
  const ThemePickerPanel({
    super.key,
    required this.l10n,
    required this.selected,
    required this.onSelected,
  });

  final AppLocalizations l10n;
  final ThemePresetId selected;
  final ValueChanged<ThemePresetId> onSelected;

  static final _lightPresets =
      ThemePresetId.values.where((p) => !p.isDarkCategory).toList();

  static final _darkPresets =
      ThemePresetId.values.where((p) => p.isDarkCategory).toList();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return AppSurface(
      radius: AppRadius.lg,
      elevation: AppElevationLevel.low,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            child: Text(
              l10n.settingsThemeSection,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: scheme.outlineVariant.withValues(alpha: 0.4),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _ThemeCategoryColumn(
                    title: l10n.settingsThemeCategoryLight,
                    presets: _lightPresets,
                    selected: selected,
                    labelFor: (p) => themePresetLabel(l10n, p),
                    onSelected: onSelected,
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: scheme.outlineVariant.withValues(alpha: 0.4),
                ),
                Expanded(
                  child: _ThemeCategoryColumn(
                    title: l10n.settingsThemeCategoryDark,
                    presets: _darkPresets,
                    selected: selected,
                    labelFor: (p) => themePresetLabel(l10n, p),
                    onSelected: onSelected,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeCategoryColumn extends StatelessWidget {
  const _ThemeCategoryColumn({
    required this.title,
    required this.presets,
    required this.selected,
    required this.labelFor,
    required this.onSelected,
  });

  final String title;
  final List<ThemePresetId> presets;
  final ThemePresetId selected;
  final String Function(ThemePresetId preset) labelFor;
  final ValueChanged<ThemePresetId> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            child: Text(
              title,
              style: textTheme.labelLarge?.copyWith(
                color: scheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (final preset in presets)
            ThemePresetListTile(
              preset: preset,
              label: labelFor(preset),
              isSelected: preset == selected,
              onTap: () => onSelected(preset),
            ),
        ],
      ),
    );
  }
}


// --- folded from language_cycle_box.dart ---

class LanguageCycleBox extends StatelessWidget {
  const LanguageCycleBox({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSurface(
      radius: AppRadius.lg,
      elevation: AppElevationLevel.low,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: BlocBuilder<AppLocaleCubit, AppLocaleState>(
        builder: (context, localeState) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  l10n.settingsLanguageSection,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FilledButton.tonal(
                onPressed: () => context.read<AppLocaleCubit>().cycleLocale(),
                child: Text(localeOptionLabel(l10n, localeState.option)),
              ),
            ],
          );
        },
      ),
    );
  }
}


// --- folded from settings_developer_panel.dart ---

class SettingsDeveloperPanel extends StatelessWidget {
  const SettingsDeveloperPanel({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.settingsDeveloperSection,
          style: textTheme.labelLarge?.copyWith(
            color: scheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppSurface(
          radius: AppRadius.lg,
          elevation: AppElevationLevel.none,
          color: scheme.surfaceContainerLow,
          border: Border.all(
            color: scheme.outlineVariant.withValues(alpha: 0.5),
            style: BorderStyle.solid,
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              final isSeeding = state.status == SettingsStatus.seeding;
              final isWiping = state.status == SettingsStatus.wiping;
              final isBusy = isSeeding || isWiping;

              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.settingsSeedDatabase,
                          style: textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      FilledButton.tonal(
                        onPressed: isBusy
                            ? null
                            : () => context.read<SettingsBloc>().add(
                                  const SettingsSeedDatabaseRequested(),
                                ),
                        child: isSeeding
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: scheme.onSecondaryContainer,
                                ),
                              )
                            : Text(l10n.settingsSeedDatabase),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.settingsWipeDatabase,
                          style: textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      FilledButton.tonal(
                        onPressed: isBusy
                            ? null
                            : () async {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (dialogContext) {
                                    final dialogScheme =
                                        Theme.of(dialogContext).colorScheme;
                                    return AlertDialog(
                                      title: Text(
                                        l10n.homeDatabaseWipeConfirmTitle,
                                      ),
                                      content: Text(
                                        l10n.homeDatabaseWipeConfirmMessage,
                                      ),
                                      actions: [
                                        TextButton(
                                          // Local dialog dismiss only —
                                          // route-level nav is BLoC-owned.
                                          onPressed: () => Navigator.of(
                                            dialogContext,
                                          ).pop(false),
                                          child: Text(l10n.homeDatabaseCancel),
                                        ),
                                        FilledButton(
                                          // Local dialog dismiss only —
                                          // route-level nav is BLoC-owned.
                                          onPressed: () => Navigator.of(
                                            dialogContext,
                                          ).pop(true),
                                          style: FilledButton.styleFrom(
                                            backgroundColor:
                                                dialogScheme.error,
                                            foregroundColor:
                                                dialogScheme.onError,
                                          ),
                                          child: Text(
                                            l10n.homeDatabaseWipeConfirmAction,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (confirmed == true && context.mounted) {
                                  context.read<SettingsBloc>().add(
                                    const SettingsWipeDatabaseRequested(),
                                  );
                                }
                              },
                        child: isWiping
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: scheme.onSecondaryContainer,
                                ),
                              )
                            : Text(l10n.settingsWipeDatabase),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

// --- folded from settings_locale_l10n.dart ---

String localeOptionLabel(AppLocalizations l10n, AppLocaleOption option) {
  return switch (option) {
    AppLocaleOption.english => l10n.settingsLanguageEnglish,
    AppLocaleOption.german => l10n.settingsLanguageGerman,
  };
}

// --- folded from settings_theme_l10n.dart ---

String themePresetLabel(AppLocalizations l10n, ThemePresetId preset) {
  return switch (preset) {
    ThemePresetId.cosmopolitan => l10n.settingsThemeCosmopolitan,
    ThemePresetId.pinaColada => l10n.settingsThemePinaColada,
    ThemePresetId.whiteRussian => l10n.settingsThemeWhiteRussian,
    ThemePresetId.chartreuse => l10n.settingsThemeChartreuse,
    ThemePresetId.blueHawaii => l10n.settingsThemeBlueHawaii,
    ThemePresetId.oldFashioned => l10n.settingsThemeOldFashioned,
  };
}
