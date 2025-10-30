import 'package:green_gym_club/app_core_design/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
