import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/models/app_locale_option.dart';
import 'package:instock/domain/repositories/locale_preferences_repository.dart';
import 'package:instock/theme/app_locale_state.dart';

class AppLocaleCubit extends Cubit<AppLocaleState> {
  AppLocaleCubit(this._repository)
      : super(const AppLocaleState(option: AppLocaleOption.english));

  final LocalePreferencesRepository _repository;

  Future<void> load() async {
    final saved = await _repository.readSelectedLocale();
    emit(
      AppLocaleState(
        option: saved ?? AppLocaleOption.english,
      ),
    );
  }

  Future<void> selectLocale(AppLocaleOption option) async {
    await _repository.writeSelectedLocale(option);
    emit(AppLocaleState(option: option));
  }

  Future<void> cycleLocale() async {
    await selectLocale(state.option.next);
  }
}
