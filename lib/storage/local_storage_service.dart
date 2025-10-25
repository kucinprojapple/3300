import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  late SharedPreferences _prefs;

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // SETTINGS
  bool get soundEnabled => _prefs.getBool('sound_enabled') ?? false;

  set soundEnabled(bool value) => _prefs.setBool('sound_enabled', value);

  bool get vibrationEnabled => _prefs.getBool('vibration_enabled') ?? false;

  set vibrationEnabled(bool value) =>
      _prefs.setBool('vibration_enabled', value);

  bool get notificationsEnabled =>
      _prefs.getBool('notifications_enabled') ?? false;

  set notificationsEnabled(bool value) =>
      _prefs.setBool('notifications_enabled', value);



}
