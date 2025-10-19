import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences?> init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      return _preferences;
    } catch (e) {
      print('Failed to initialize SharedPreferences: $e');
      return null;
    }
  }

  static SharedPreferences? get preferences => _preferences;

  static Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await _preferences?.setStringList(key, value) ?? false;
    } catch (e) {
      print('Failed to set string list: $e');
      return false;
    }
  }

  static List<String> getStringList(String key) {
    try {
      return _preferences?.getStringList(key) ?? [];
    } catch (e) {
      print('Failed to get string list: $e');
      return [];
    }
  }
}
