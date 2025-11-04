import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import '../../app_core_design/music.dart';
import '../storage/local_storage_service.dart';

class MusicService {
  static final _storage = LocalStorageService();
  static final _musicPlayer = AudioPlayer();

  static bool _musicPlaying = false;
  static double _currentVolume = 0.0;
  static Timer? _fadeTimer;

  /// --- Background Music ---
  static Future<void> playMenuMusic() async {
    if (!_storage.musicEnabled || _musicPlaying) return;

    await _musicPlayer.setReleaseMode(ReleaseMode.loop);
    await _musicPlayer.setSource(AssetSource(AppMusic.backgroundMusic));
    await _musicPlayer.setVolume(0);
    await _musicPlayer.resume();

    _musicPlaying = true;
    _fadeTo(1.0, durationMs: 1500);
  }

  static Future<void> stopMenuMusic() async {
    if (!_musicPlaying) return;

    await _fadeTo(0.0, durationMs: 1000);
    await _musicPlayer.stop();
    _musicPlaying = false;
  }

  static Future<void> pauseMenuMusic() async {
    if (!_musicPlaying) return;
    await _fadeTo(0.0, durationMs: 500);
    await _musicPlayer.pause();
  }

  static Future<void> resumeMenuMusic() async {
    if (!_storage.soundEnabled) return;
    await _musicPlayer.resume();
    _fadeTo(1.0, durationMs: 800);
  }

  /// --- Fade Logic ---
  static Future<void> _fadeTo(
    double targetVolume, {
    int durationMs = 1000,
  }) async {
    _fadeTimer?.cancel();
    const tick = Duration(milliseconds: 50);
    final steps = durationMs ~/ tick.inMilliseconds;
    final start = _currentVolume;
    final delta = (targetVolume - start) / steps;
    int count = 0;

    _fadeTimer = Timer.periodic(tick, (timer) {
      count++;
      _currentVolume = (start + delta * count).clamp(0.0, 1.0);
      _musicPlayer.setVolume(_currentVolume);
      if (count >= steps) {
        timer.cancel();
        _currentVolume = targetVolume;
      }
    });
  }
}
