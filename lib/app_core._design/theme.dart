import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' show AppColors;

sealed class AppTheme {
  const AppTheme._();

  static ThemeData get mainTheme => _mainTheme;

  static final ThemeData _mainTheme = ThemeData(
    useMaterial3: true,
    splashColor: AppColors.main.background,
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.main.background,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.main.background,
      indicatorColor: AppColors.main.white,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
  );
}
