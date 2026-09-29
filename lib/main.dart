import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/di/di.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/theme/app_locale_cubit.dart';
import 'package:instock/theme/app_locale_state.dart';
import 'package:instock/theme/app_theme_cubit.dart';
import 'package:instock/theme/app_theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const InStockApp());
}

class InStockApp extends StatelessWidget {
  const InStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AppThemeCubit>()),
        BlocProvider.value(value: getIt<AppLocaleCubit>()),
      ],
      child: BlocBuilder<AppLocaleCubit, AppLocaleState>(
        builder: (context, localeState) {
          return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                title: 'inStock',
                locale: localeState.locale,
                theme: themeState.themeData,
                themeMode: ThemeMode.light,
                localizationsDelegates:
                    AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}
