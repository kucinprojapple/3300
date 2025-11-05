// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

sealed class AppColors {
  static const _MainColors _mainColors = _MainColors();
  static const _TextColors _textColors = _TextColors();
  static const _GradientColors _gradientColors = _GradientColors();

  static _MainColors get mainColors => _mainColors;

  static _TextColors get textColors => _textColors;

  static _GradientColors get gradientColors => _gradientColors;
}

class _MainColors {
  const _MainColors();

  final Color background = const Color.fromARGB(255, 10, 183, 240);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
}

class _TextColors {
  const _TextColors();

  // final Color shadowNumbers = const Color.fromRGBO(0, 0, 0, 0.55);
  final Color shadowNumbers = const Color.fromRGBO(0, 0, 0, 0.55);
  final LinearGradient numbersGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(255, 226, 170, 1),
    ],
  );
}

class _GradientColors {
  const _GradientColors();

  final LinearGradient containerGradientDarkGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(29, 84, 1, 1), Color.fromRGBO(2, 5, 0, 1)],
  );

  final LinearGradient containerGradientBrightGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(56, 154, 7, 1), Color.fromRGBO(2, 5, 0, 1)],
  );

  final LinearGradient containerGradientDeepDarkGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(14, 40, 1, 1), Color.fromRGBO(2, 5, 0, 1)],
  );

  final LinearGradient borderGradientDarkGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(126, 123, 123, 1),
      Color.fromRGBO(132, 132, 132, 1),
    ],
  );

  final LinearGradient borderGradientBrightGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(30, 30, 30, 1), Color.fromRGBO(132, 132, 132, 1)],
  );

  final LinearGradient borderGradientDeepDarkGreen = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(126, 123, 123, 1),
      Color.fromRGBO(132, 132, 132, 1),
    ],
  );
}
