// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:text_gradiate/text_gradiate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart' show AppColors;

const String _fontFamily = 'OtomanopeeOne';

final textLightShadows = [
  Shadow(
    offset: Offset(0.w, 1.59.h),
    blurRadius: 1.59.r,
    color: AppColors.textColors.shadowNumbers,
  ),
];

sealed class AppTextStyles {
  static Headers headers(BuildContext context) => Headers(context);

  static ButtonBody buttonBody(BuildContext context) => ButtonBody(context);

  static TinyBody tinyBody(BuildContext context) => TinyBody(context);

  static TabTextBody tabTextBody(BuildContext context) => TabTextBody(context);

  static MainTextBody mainTextBody(BuildContext context) =>
      MainTextBody(context);
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
    // shadows: textAccentShadows,
    // color: AppColors.text.pink,
  );
  final TextStyle m = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    letterSpacing: 0.7,
    // color: AppColors.text.primary,
  );
  final TextStyle s = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    letterSpacing: 0.7,
    // shadows: textAccentShadows,
    // color: AppColors.text.primary,
  );
  final TextStyle xs = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 19,
    letterSpacing: 0.1,
    shadows: textLightShadows,
    // color: AppColors.main.white,
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
    // shadows: [Shadow(offset: Offset(-1, -2), color: AppColors.text.shadows)],
    // color: AppColors.text.primary,
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
    // color: AppColors.text.primary,
    // shadows: textAccentShadows,
  );
  final TextStyle xl = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 19,
    letterSpacing: 0.5,
    // color: AppColors.main.white,
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
    // color: AppColors.main.background,
  );
  final TextStyle unSelected = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    letterSpacing: 0.5,
    // color: AppColors.text.primary,
  );
}

enum TextSize { l, m, s, xs }

class MainTextBody {
  late final TextStyle l;
  late final TextStyle m;
  late final TextStyle s;
  late final TextStyle xs;

  MainTextBody(BuildContext context) {
    l = _MainTextBody().l;
    m = _MainTextBody().m;
    s = _MainTextBody().s;
    xs = _MainTextBody().xs;
  }

  static Widget gradientText(
    BuildContext context,
    String text, {
    TextSize size = TextSize.l,
    double? height,
    double? fontSize,
    Alignment alignment = Alignment.center,
    TextAlign textAlign = TextAlign.center,
    bool useGradient = true,
    bool useShadow = true,
    List<Color>? gradientColors,
    Color? fallbackColor,
  }) {
    final numbers = AppTextStyles.mainTextBody(context);
    late TextStyle style;

    switch (size) {
      case TextSize.l:
        style = numbers.l;
        break;
      case TextSize.m:
        style = numbers.m;
        break;
      case TextSize.s:
        style = numbers.s;
        break;
      case TextSize.xs:
        style = numbers.xs;
        break;
    }

    if (height != null) {
      style = style.copyWith(height: height);
    }

    if (fontSize != null) {
      style = style.copyWith(fontSize: fontSize.sp);
    }

    if (!useShadow) {
      style = style.copyWith(shadows: []);
    }

    final textWidget = Text(
      text,
      textAlign: textAlign,
      style: style.copyWith(
        color: useGradient ? null : (fallbackColor ?? Colors.white),
      ),
    );

    final gradient =
        gradientColors ?? AppColors.textColors.numbersGradient.colors;

    return Align(
      alignment: alignment,
      child:
          useGradient
              ? TextGradiate(
                text: textWidget,
                colors: gradient,
                gradientType: GradientType.linear,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp,
              )
              : textWidget,
    );
  }
}

class _MainTextBody {
  final TextStyle l = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 30.sp,
    height: 0.85,
    letterSpacing: 0,
    shadows: textLightShadows,
  );

  final TextStyle m = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 25.sp,
    height: 0.85,
    letterSpacing: 0,
    shadows: textLightShadows,
  );

  final TextStyle s = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    height: 0.85,
    letterSpacing: 0,
    shadows: textLightShadows,
  );

  final TextStyle xs = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    height: 0.85,
    letterSpacing: 0,
    shadows: textLightShadows,
  );
}
