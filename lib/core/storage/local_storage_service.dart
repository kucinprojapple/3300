import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_core_design/assets.dart';
import '../../features/game/models/game_exercise_stats.dart';

class LocalStorageKeys {
  static const playerName = 'player_name';
  static const playerAvatar = 'player_avatar';
  static const playerTitle = 'player_title';
  static const soundEnabled = 'sound_enabled';
  static const musicEnabled = 'music_enabled';
  static const vibrationEnabled = 'vibration_enabled';
  static const timerDuration = 'timer_duration';
  static const exerciseStats = 'exercise_stats';
}

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  SharedPreferences? _prefs;

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> ensureInitialized() async {
    if (_prefs == null) {
      await init();
    }
  }

  Future<void> setValue<T>(String key, T value) async {
    await ensureInitialized();

    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is Map) {
      await _prefs!.setString(key, jsonEncode(value));
    } else {
      throw UnsupportedError('Unsupported value type: ${value.runtimeType}');
    }
  }

  T getValue<T>(String key, T defaultValue) {
    final value = _prefs?.get(key);
    if (value == null) return defaultValue;
    return value as T;
  }

  // ---------- Player ----------
  String get playerName => getValue(LocalStorageKeys.playerName, '');

  set playerName(String value) => setValue(LocalStorageKeys.playerName, value);

  // async writer for name
  Future<void> setPlayerName(String value) async {
    await ensureInitialized();
    await setValue(LocalStorageKeys.playerName, value);
  }

  String get playerAvatar =>
      getValue(LocalStorageKeys.playerAvatar, AppAssets.avatarWoman);

  set playerAvatar(String value) =>
      setValue(LocalStorageKeys.playerAvatar, value);

  // async writer for avatar
  Future<void> setPlayerAvatar(String value) async {
    await ensureInitialized();
    await setValue(LocalStorageKeys.playerAvatar, value);
  }

  String get playerTitle =>
      getValue(LocalStorageKeys.playerTitle, 'No title selected');

  set playerTitle(String value) =>
      setValue(LocalStorageKeys.playerTitle, value);

  // async writer for title
  Future<void> setPlayerTitle(String value) async {
    await ensureInitialized();
    await setValue(LocalStorageKeys.playerTitle, value);
  }

  // ---------- Settings ----------
  bool get soundEnabled => getValue(LocalStorageKeys.soundEnabled, false);

  set soundEnabled(bool value) =>
      setValue(LocalStorageKeys.soundEnabled, value);

  bool get musicEnabled => getValue(LocalStorageKeys.musicEnabled, false);

  set musicEnabled(bool value) =>
      setValue(LocalStorageKeys.musicEnabled, value);

  bool get vibrationEnabled =>
      getValue(LocalStorageKeys.vibrationEnabled, false);

  set vibrationEnabled(bool value) =>
      setValue(LocalStorageKeys.vibrationEnabled, value);

  int get timerDuration => getValue(LocalStorageKeys.timerDuration, 30);

  set timerDuration(int value) =>
      setValue(LocalStorageKeys.timerDuration, value);

  // ---------- Exercise Stats ----------
  Map<String, GameExerciseStats> get exerciseStats {
    final jsonString = _prefs?.getString(LocalStorageKeys.exerciseStats);
    if (jsonString == null) return {};
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    return decoded.map(
      (key, value) => MapEntry(key, GameExerciseStats.fromJson(value)),
    );
  }

  Future<void> addExerciseProgress({
    required String exerciseName,
    required int exerciseTime,
    required int exerciseReps,
  }) async {
    await ensureInitialized();

    final allStats = exerciseStats;
    final previousStats =
        allStats[exerciseName] ?? GameExerciseStats(exerciseName: exerciseName);
    final updatedStats =
        previousStats +
        GameExerciseStats(
          exerciseName: exerciseName,
          exerciseTime: exerciseTime,
          exerciseReps: exerciseReps,
        );

    allStats[exerciseName] = updatedStats;

    await setValue(
      LocalStorageKeys.exerciseStats,
      allStats.map((k, v) => MapEntry(k, v.toJson())),
    );

    if (kDebugMode) {
      debugPrint('✅ Updated: $exerciseName');
      debugPrint(
        '⏱  +$exerciseTime seconds (total: ${updatedStats.exerciseTime} seconds)',
      );
      debugPrint(
        '🔁 +$exerciseReps reps (total: ${updatedStats.exerciseReps} reps)',
      );
      debugPrint('──────────────────────────────');
      printAllExerciseStats();
    }
  }

  void printAllExerciseStats() {
    if (!kDebugMode) return;

    final allStats = exerciseStats;
    if (allStats.isEmpty) {
      debugPrint('📭 No exercise stats found.');
      return;
    }

    debugPrint('🏋 All Exercise Stats:');
    debugPrint('──────────────────────────────');
    for (final stat in allStats.values) {
      debugPrint(
        '💡 ${stat.exerciseName}: ⏱ ${stat.exerciseTime}s | 🔁 ${stat.exerciseReps}',
      );
    }
    debugPrint('──────────────────────────────');
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
