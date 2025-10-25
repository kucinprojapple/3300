import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' show AppColors;

sealed class AppTheme {
  const AppTheme._();

  static ThemeData get mainTheme => _mainTheme;

  static final ThemeData _mainTheme = ThemeData(
    useMaterial3: true,
    splashColor: AppColors.mainColors.background,
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.mainColors.background,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.mainColors.background,
      indicatorColor: AppColors.mainColors.white,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
  );
}
