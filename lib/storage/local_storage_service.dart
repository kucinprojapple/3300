import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_core_design/assets.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  late SharedPreferences _prefs;

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // PLAYER DATA
  String get playerName => _prefs.getString('player_name') ?? '';

  set playerName(String value) => _prefs.setString('player_name', value);

  String get playerAvatar =>
      _prefs.getString('player_avatar') ?? AppAssets.avatarWoman;

  set playerAvatar(String value) => _prefs.setString('player_avatar', value);

  // SETTINGS
  bool get soundEnabled => _prefs.getBool('sound_enabled') ?? false;

  set soundEnabled(bool value) => _prefs.setBool('sound_enabled', value);

  bool get musicEnabled => _prefs.getBool('music_enabled') ?? false;

  set musicEnabled(bool value) => _prefs.setBool('music_enabled', value);

  bool get vibrationEnabled => _prefs.getBool('vibration_enabled') ?? false;

  set vibrationEnabled(bool value) =>
      _prefs.setBool('vibration_enabled', value);

  int get timerDuration => _prefs.getInt('timer_duration') ?? 30;

  set timerDuration(int value) => _prefs.setInt('timer_duration', value);


  // EXERCISES
static const String _exerciseStatsKey = 'exercise_stats';

/// Получить всю статистику по упражнениям
Map<String, Map<String, int>> get exerciseStats {
  final jsonString = _prefs.getString(_exerciseStatsKey);
  if (jsonString == null) return {};
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  return decoded.map((key, value) => MapEntry(
    key,
    {
      'time': value['time'] ?? 0,
      'reps': value['reps'] ?? 0,
    },
  ));
}

/// Получить статистику по конкретному упражнению
Map<String, int> getExerciseStats(String exerciseName) {
  final all = exerciseStats;
  return all[exerciseName] ?? {'time': 0, 'reps': 0};
}

/// Добавить прогресс (накопительно)
Future<void> addExerciseProgress({
  required String exerciseName,
  required int seconds,
  required int reps,
}) async {
  final all = exerciseStats;
  final prev = all[exerciseName] ?? {'time': 0, 'reps': 0};
  all[exerciseName] = {
    'time': prev['time']! + seconds,
    'reps': prev['reps']! + reps,
  };
  await _prefs.setString(_exerciseStatsKey, jsonEncode(all));
}

/// Очистить всю статистику
Future<void> clearExerciseStats() async {
  await _prefs.remove(_exerciseStatsKey);
}
}