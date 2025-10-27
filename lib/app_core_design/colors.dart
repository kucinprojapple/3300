// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

sealed class AppColors {
  static const _MainColors _mainColors = _MainColors();
  static const _AccentColors _accentColors = _AccentColors();
  static const _TextColors _textColors = _TextColors();
  static const _BrickColors _brickColors = _BrickColors();

  static _MainColors get mainColors => _mainColors;
  static _AccentColors get accentColors => _accentColors;
  static _TextColors get textColors => _textColors;
  static _BrickColors get brickColors => _brickColors;
}

class _MainColors {
  const _MainColors();
  final Color background = const Color.fromARGB(255, 10, 183, 240);
  // final Color leader = const Color.fromARGB(255, 132, 41, 207);
  // final Color backgroundGradientOne = const Color.fromRGBO(255, 11, 214, 1);
  // final Color backgroundGradientTwo = const Color.fromARGB(255, 248, 224, 4);
  // final Color black = const Color.fromARGB(255, 0, 0, 0);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
  // final Color whiteTransperent = const Color.fromARGB(145, 255, 255, 255);
  // final Color grey = const Color.fromARGB(255, 150, 150, 150);
}

class _AccentColors {
  const _AccentColors();
  // final Color primary = const Color.fromRGBO(186, 37, 184, 1);
  // final Color primaryDart = const Color.fromRGBO(73, 15, 93, 1);
  // final Color secondary = const Color.fromRGBO(34, 7, 61, 1);
  // final Color secondaryBlue = const Color.fromARGB(255, 52, 13, 249);
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
  // final Color primary = const Color.fromARGB(255, 10, 183, 240);
  // final Color pink = const Color.fromRGBO(254, 54, 236, 1);
  // final Color orange = const Color.fromRGBO(225, 62, 40, 1);
  // final Color yellow = const Color.fromARGB(255, 225, 200, 40);
  // final Color shadows = const Color.fromARGB(221, 74, 15, 93);
}

class _BrickColors {
  const _BrickColors();
  // final Color forYellowBall = const Color.fromRGBO(255, 38, 233, 1);
  // final Color forGreenBall = const Color.fromRGBO(2254, 49, 73, 1);
  // final Color forAquaBall = const Color.fromRGBO(158, 81, 255, 1);
  // final Color forBlueBall = const Color.fromRGBO(54, 135, 253, 1);
}
