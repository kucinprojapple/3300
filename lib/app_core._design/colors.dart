// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

sealed class AppColors {
  static const _Main _main = _Main();
  static const _AccentColors _accent = _AccentColors();
  static const _Text _text = _Text();
  static const _BrickColors _brick = _BrickColors();

  static _Main get main => _main;
  static _AccentColors get accent => _accent;
  static _Text get text => _text;
  static _BrickColors get brick => _brick;
}

class _Main {
  const _Main();
  final Color background = const Color.fromARGB(255, 10, 183, 240);
  final Color leader = const Color.fromARGB(255, 132, 41, 207);
  final Color backgroundGradientOne = const Color.fromRGBO(255, 11, 214, 1);
  final Color backgroundGradientTwo = const Color.fromARGB(255, 248, 224, 4);
  final Color black = const Color.fromARGB(255, 0, 0, 0);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
  final Color whiteTransperent = const Color.fromARGB(145, 255, 255, 255);
  final Color grey = const Color.fromARGB(255, 150, 150, 150);
}

class _AccentColors {
  const _AccentColors();

  final Color primary = const Color.fromRGBO(186, 37, 184, 1);
  final Color primaryDart = const Color.fromRGBO(73, 15, 93, 1);
  final Color secondary = const Color.fromRGBO(34, 7, 61, 1);
  final Color secondaryBlue = const Color.fromARGB(255, 52, 13, 249);
}

class _Text {
  const _Text();
  final Color primary = const Color.fromARGB(255, 10, 183, 240);
  final Color pink = const Color.fromRGBO(254, 54, 236, 1);
  final Color orange = const Color.fromRGBO(225, 62, 40, 1);
  final Color yellow = const Color.fromARGB(255, 225, 200, 40);
  final Color shadows = const Color.fromARGB(221, 74, 15, 93);
}

class _BrickColors {
  const _BrickColors();

  final Color forYellowBall = const Color.fromRGBO(255, 38, 233, 1);
  final Color forGreenBall = const Color.fromRGBO(2254, 49, 73, 1);
  final Color forAquaBall = const Color.fromRGBO(158, 81, 255, 1);
  final Color forBlueBall = const Color.fromRGBO(54, 135, 253, 1);
}
