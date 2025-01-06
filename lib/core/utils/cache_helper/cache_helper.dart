import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<void> saveData(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  Future<int?> getIntData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(key);
    return result;
  }

  Future<String?> getStringData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(key);
    return result;
  }

  Future<double?> getDoubleData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getDouble(key);
    return result;
  }

  Future<bool?> getBoolData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(key);
    return result;
  }
}
