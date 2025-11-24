import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class FeaturesRepository {
  static const linkKey = 'ink';
  static const userAgnetKey = 'agent';
  static const moderKey = 'oder';
  static const fcmKey = 'fcmess';
  final SharedPreferences _preferences;

  FeaturesRepository({required SharedPreferences preferences})
    : _preferences = preferences;

  String getLink() {
    return _preferences.getString(linkKey) ?? '';
  }

  Future<void> setLink(String value) async {
    await _preferences.setString(linkKey, value);
  }

  Future<void> setModer(String value) async {
    await _preferences.setString(moderKey, value);
  }

  String getModer() {
    return _preferences.getString(moderKey) ?? '';
  }

  Future<void> setToken(String value) async {
    await _preferences.setString(fcmKey, value);
  }

  String getToken() {
    return _preferences.getString(fcmKey) ?? '';
  }

  Future<void> setUserAgent(String value) async {
    await _preferences.setString(userAgnetKey, value);
  }

  String getUserAgnet() {
    return _preferences.getString(userAgnetKey) ?? '';
  }
}
