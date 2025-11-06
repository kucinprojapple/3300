import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../../app_core_design/sounds.dart';
import '../storage/local_storage_service.dart';

class SoundService {
  static final _storage = LocalStorageService();

  static final _effectPlayer = AudioPlayer();
  static final _tickPlayer = AudioPlayer();

  static Timer? _tickTimer;
  static bool _isTicking = false;

  static Future<void> playTick() async {
    if (!_storage.soundEnabled) return;
    await _effectPlayer.play(AssetSource(AppSounds.tick));
  }

  static Future<void> playBeep() async {
    if (!_storage.soundEnabled) return;
    await _effectPlayer.play(AssetSource(AppSounds.beep));
  }

  static Future<void> playCountdown() async {
    if (!_storage.soundEnabled) return;
    await _effectPlayer.play(AssetSource(AppSounds.countdown));
  }

  static Future<void> playLongBeep() async {
    if (!_storage.soundEnabled) return;
    await _effectPlayer.play(AssetSource(AppSounds.longBeep));
  }

  static Future<void> playFlip() async {
    if (!_storage.soundEnabled) return;
    await _effectPlayer.play(AssetSource(AppSounds.flip));
  }

  static Future<void> preloadCountdownSounds() async {
    if (!_storage.soundEnabled) return;
    try {
      await _effectPlayer.setSource(AssetSource(AppSounds.countdown));
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ preloadCountdownSounds error: $e');
      }
    }
  }

  static void startTicking() {
    if (!_storage.soundEnabled || _isTicking) return;

    _isTicking = true;

    _tickTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (!_isTicking) return;
      try {
        await _tickPlayer.stop();
        await _tickPlayer.play(AssetSource(AppSounds.tick));
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ startTicking error: $e');
        }
      }
    });
  }

  static Future<void> stopTicking() async {
    if (!_isTicking) return;

    _isTicking = false;

    _tickTimer?.cancel();
    _tickTimer = null;

    try {
      await _tickPlayer.stop();
      await _tickPlayer.release();
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ stopTicking error: $e');
      }
    }

    await Future.delayed(const Duration(milliseconds: 100));
  }
}
