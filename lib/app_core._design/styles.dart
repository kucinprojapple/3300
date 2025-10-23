// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'colors.dart' show AppColors;

const String _fontFamily = 'OtomanopeeOne';

final textAccentShadows = [
  Shadow(offset: Offset(-1, -2), color: AppColors.accent.primaryDart),
];
final textWhiteShadows = [
  Shadow(offset: Offset(1, -2), color: AppColors.main.white),
];
final textLightShadows = [
  Shadow(offset: Offset(-1, -2), color: AppColors.text.primary),
];

sealed class AppTextStyles {
  static Headers headers(BuildContext context) => Headers(context);
  static ButtonBody buttonBody(BuildContext context) => ButtonBody(context);
  static TinyBody tinyBody(BuildContext context) => TinyBody(context);
  static TabTextBody tabTextBody(BuildContext context) => TabTextBody(context);
}

sealed class AppSize {
  static double iconSize = 65;
  static double padding = 6;
}

class Headers {
  late final TextStyle l;
  late final TextStyle m;
  late final TextStyle s;

  Headers(BuildContext context) {
    l = _Headers().l;
    m = _Headers().m;
    s = _Headers().s;
  }
}

class ButtonBody {
  late final TextStyle l;
  late final TextStyle m;
  late final TextStyle s;
  late final TextStyle xs;

  ButtonBody(BuildContext context) {
    l = _ButtonBody().l;
    m = _ButtonBody().m;
    s = _ButtonBody().s;
    xs = _ButtonBody().xs;
  }
}

class _ButtonBody {
  final TextStyle l = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.7,
    fontSize: 36,
    shadows: textAccentShadows,
    color: AppColors.text.pink,
  );
  final TextStyle m = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    letterSpacing: 0.7,
    color: AppColors.text.primary,
  );
  final TextStyle s = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    letterSpacing: 0.7,
    shadows: textAccentShadows,
    color: AppColors.text.primary,
  );
  final TextStyle xs = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 19,
    letterSpacing: 0.1,
    shadows: textLightShadows,
    color: AppColors.main.white,
  );
}

class TinyBody {
  late final TextStyle s;
  late final TextStyle m;
  late final TextStyle l;
  late final TextStyle xl;

  TinyBody(BuildContext context) {
    s = _TinyBody().s;
    m = _TinyBody().m;
    l = _TinyBody().l;
    xl = _TinyBody().xl;
  }
}

class _Headers {
  final TextStyle l = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 38,
    letterSpacing: 1,
    shadows: [Shadow(offset: Offset(-1, -2), color: AppColors.text.shadows)],
    color: AppColors.text.primary,
  );
  final TextStyle m = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    letterSpacing: 1,
  );
  final TextStyle s = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    letterSpacing: 1,
  );
}

class _TinyBody {
  final TextStyle s = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    letterSpacing: 0.5,
  );
  final TextStyle m = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0.5,
  );
  final TextStyle l = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.5,
    color: AppColors.text.primary,
    shadows: textAccentShadows,
  );
  final TextStyle xl = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 19,
    letterSpacing: 0.5,
    color: AppColors.main.white,
    shadows: textLightShadows,
  );
}

class TabTextBody {
  late final TextStyle selected;
  late final TextStyle unselected;
  TabTextBody(BuildContext context) {
    selected = _TabTextBody().selected;
    unselected = _TabTextBody().unSelected;
  }
}

class _TabTextBody {
  final TextStyle selected = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 18,
    letterSpacing: 0.5,
    color: AppColors.main.background,
  );
  final TextStyle unSelected = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    letterSpacing: 0.5,
    color: AppColors.text.primary,
  );
}
