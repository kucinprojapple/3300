import 'dart:io';

import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import '../storage/local_storage_service.dart';

class VibrationService {
  static final _storage = LocalStorageService();

  static Future<bool> _canVibrate() async {
    if (!_storage.vibrationEnabled) return false;
    return await Vibration.hasVibrator();
  }

  /// Light vibration (navigation, click)
  static Future<void> lightImpact() async {
    if (!await _canVibrate()) return;

    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      Vibration.vibrate(duration: 100, amplitude: 120);
    }
  }

  /// Medium vibration (rewards, success)
  static Future<void> mediumImpact() async {
    if (!await _canVibrate()) return;

    if (Platform.isIOS) {
      HapticFeedback.mediumImpact();
    } else {
      Vibration.vibrate(duration: 150, amplitude: 180);
    }
  }

  /// Strong vibration (achievement, victory)
  static Future<void> heavyImpact() async {
    if (!await _canVibrate()) return;

    if (Platform.isIOS) {
      HapticFeedback.heavyImpact();
    } else {
      Vibration.vibrate(duration: 200, amplitude: 240);
    }
  }
}
