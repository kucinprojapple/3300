import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_core_design/assets.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  SharedPreferences? _prefs;
  bool _initialized = false;

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    _initialized = true;
  }

  Future<void> ensureInitialized() async {
    if (!_initialized || _prefs == null) {
      await init();
    }
  }

  bool get isInitialized => _initialized;

  // PLAYER DATA
  String get playerName => _prefs?.getString('player_name') ?? '';

  set playerName(String value) => _prefs?.setString('player_name', value);

  String get playerAvatar =>
      _prefs?.getString('player_avatar') ?? AppAssets.avatarWoman;

  set playerAvatar(String value) => _prefs?.setString('player_avatar', value);

  // SETTINGS
  bool get soundEnabled => _prefs?.getBool('sound_enabled') ?? false;

  set soundEnabled(bool value) => _prefs?.setBool('sound_enabled', value);

  bool get musicEnabled => _prefs?.getBool('music_enabled') ?? false;

  set musicEnabled(bool value) => _prefs?.setBool('music_enabled', value);

  bool get vibrationEnabled => _prefs?.getBool('vibration_enabled') ?? false;

  set vibrationEnabled(bool value) =>
      _prefs?.setBool('vibration_enabled', value);

  int get timerDuration => _prefs?.getInt('timer_duration') ?? 30;

  set timerDuration(int value) => _prefs?.setInt('timer_duration', value);

  // EXERCISES
  static const String _exerciseStatsKey = 'exercise_stats';

  Map<String, Map<String, int>> get exerciseStats {
    final jsonString = _prefs?.getString(_exerciseStatsKey);
    if (jsonString == null) return {};
    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return decoded.map(
      (key, value) => MapEntry(key, {
        'time': value['time'] ?? 0,
        'reps': value['reps'] ?? 0,
      }),
    );
  }

  Map<String, int> getExerciseStats(String exerciseName) {
    final all = exerciseStats;
    return all[exerciseName] ?? {'time': 0, 'reps': 0};
  }

  Future<void> addExerciseProgress({
    required String exerciseName,
    required int seconds,
    required int reps,
  }) async {
    await ensureInitialized();
    final all = exerciseStats;
    final prev = all[exerciseName] ?? {'time': 0, 'reps': 0};
    all[exerciseName] = {
      'time': prev['time']! + seconds,
      'reps': prev['reps']! + reps,
    };
    await _prefs?.setString(_exerciseStatsKey, jsonEncode(all));

    debugPrint('💡 --- Exercise progress updated ---');
    debugPrint('💡 Exercise: $exerciseName');
    debugPrint('💡 Previous stats: $prev');
    debugPrint('💡 Added time: $seconds s, reps: $reps');
    debugPrint('💡 New total: ${all[exerciseName]}');
    debugPrint('💡 ----------------------------------\n');
  }

  Future<void> saveExerciseRecord(int result) async {
    await ensureInitialized();
    await _prefs?.setInt('exercise_record', result);

    debugPrint('💾 Exercise record saved: $result');
  }

  Future<void> clearExerciseStats() async {
    await _prefs?.remove(_exerciseStatsKey);
  }
}
