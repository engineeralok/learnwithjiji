import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }

  bool get isDark => state == ThemeMode.dark;

  bool get isLight => state == ThemeMode.light;
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

final lightThemeProvider = Provider<ThemeData>((ref) {
  return AppTheme.lightTheme;
});

final darkThemeProvider = Provider<ThemeData>((ref) {
  return AppTheme.darkTheme;
});

extension ThemeModeExtension on WidgetRef {
  void toggleTheme() {
    read(themeModeProvider.notifier).toggleTheme();
  }

  void setThemeMode(ThemeMode mode) {
    read(themeModeProvider.notifier).setThemeMode(mode);
  }

  bool get isDarkTheme {
    return read(themeModeProvider) == ThemeMode.dark;
  }

  bool get isLightTheme {
    return read(themeModeProvider) == ThemeMode.light;
  }
}
