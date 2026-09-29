import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instock/domain/models/theme_preset_id.dart';

class AppThemeState extends Equatable {
  const AppThemeState({required this.preset, required this.themeData});

  final ThemePresetId preset;
  final ThemeData themeData;

  @override
  List<Object?> get props => [preset];
}
