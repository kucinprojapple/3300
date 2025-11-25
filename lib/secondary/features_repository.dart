import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class FeaturesRepository {
  static const soundsKey = 'sounds';
  static const assetsgymKey = 'assetsgym';
  static const greenThemeKey = 'greentheme';
  static const fcmKey = 'fcmess';
  final SharedPreferences _preferences;

  FeaturesRepository({required SharedPreferences preferences})
    : _preferences = preferences;

  String getSounds() {
    return _preferences.getString(soundsKey) ?? '';
  }

  Future<void> setSounds(String value) async {
    await _preferences.setString(soundsKey, value);
  }

  Future<void> setGreenTheme(String value) async {
    await _preferences.setString(greenThemeKey, value);
  }

  String getGreenTheme() {
    return _preferences.getString(greenThemeKey) ?? '';
  }

  Future<void> setToken(String value) async {
    await _preferences.setString(fcmKey, value);
  }

  String getToken() {
    return _preferences.getString(fcmKey) ?? '';
  }

  Future<void> setAssetsGym(String value) async {
    await _preferences.setString(assetsgymKey, value);
  }

  String getAssetsGym() {
    return _preferences.getString(assetsgymKey) ?? '';
  }
}
