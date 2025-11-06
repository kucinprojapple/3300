import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

import '../../app_core_design/music.dart';
import '../storage/local_storage_service.dart';

class MusicService {
  static final _storage = LocalStorageService();
  static final AudioPlayer _player = AudioPlayer();

  static bool _isPlaying = false;
  static double _currentVolume = 0.0;
  static Timer? _fadeTimer;
  static Timer? _loopTimer;

  static const Duration _overlap = Duration(milliseconds: 200);

  static Future<void> playMenuMusic() async {
    if (!_storage.musicEnabled || _isPlaying) return;

    await _player.setSource(AssetSource(AppMusic.backgroundMusic));
    await _player.setVolume(0);
    await _player.resume();
    _isPlaying = true;

    _fadeTo(1.0, durationMs: 1500);

    final duration = await _player.getDuration();
    if (duration != null) {
      _scheduleOverlapRestart(duration);
    }
  }

  static void _scheduleOverlapRestart(Duration duration) {
    _loopTimer?.cancel();
    final restartAt = duration - _overlap;

    _loopTimer = Timer(restartAt, () async {
      if (!_isPlaying) return;
      try {
        await _player.seek(Duration.zero);
        await _player.resume();
        _scheduleOverlapRestart(duration);
      } catch (_) {}
    });
  }

  static Future<void> stopMenuMusic() async {
    if (!_isPlaying) return;

    _loopTimer?.cancel();
    await _fadeTo(0.0, durationMs: 1000);
    await _player.stop();
    _isPlaying = false;
  }

  static Future<void> pauseMenuMusic() async {
    if (!_isPlaying) return;

    await _fadeTo(0.0, durationMs: 500);
    await _player.pause();
    _loopTimer?.cancel();
  }

  static Future<void> resumeMenuMusic() async {
    if (!_storage.musicEnabled) return;

    await _player.resume();
    _fadeTo(1.0, durationMs: 800);

    final duration = await _player.getDuration();
    if (duration != null) {
      _scheduleOverlapRestart(duration);
    }
  }

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
      _player.setVolume(_currentVolume);
      if (count >= steps) {
        timer.cancel();
        _currentVolume = targetVolume;
      }
    });
  }
}
