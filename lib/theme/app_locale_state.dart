import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instock/domain/models/app_locale_option.dart';

class AppLocaleState extends Equatable {
  const AppLocaleState({required this.option});

  final AppLocaleOption option;

  Locale get locale => Locale(option.languageCode);

  @override
  List<Object?> get props => [option];
}
