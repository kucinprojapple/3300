import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import '../storage/local_storage_service.dart';
import '../../app_core_design/sounds.dart';

class SoundService {
  static final _storage = LocalStorageService();
  static final _soundPlayer = AudioPlayer();

  /// --- Sound Effects ---
  static Future<void> playTick() async {
    if (!_storage.soundEnabled) return;
    await _soundPlayer.play(AssetSource(AppSounds.tick));
  }

  static Future<void> playBeep() async {
    if (!_storage.soundEnabled) return;
    await _soundPlayer.play(AssetSource(AppSounds.beep));
  }

  static Future<void> playCountdown() async {
    if (!_storage.soundEnabled) return;
    await _soundPlayer.play(AssetSource(AppSounds.countdown));
  }

  static Future<void> playLongBeep() async {
    if (!_storage.soundEnabled) return;
    await _soundPlayer.play(AssetSource(AppSounds.longBeep));
  }

  static Future<void> playFlip() async {
    if (!_storage.soundEnabled) return;
    await _soundPlayer.play(AssetSource(AppSounds.flip));
  }
}
