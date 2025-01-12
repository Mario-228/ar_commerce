import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<void> saveData<T>(String key, T value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception('Invalid value type');
    }
  }

  Future<T> getData<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (T is String) {
      return prefs.getString(key) as T;
    } else if (T is int) {
      return prefs.getInt(key) as T;
    } else if (T is double) {
      return prefs.getDouble(key) as T;
    } else if (T is bool) {
      return prefs.getBool(key) as T;
    } else if (T is List<String>) {
      return prefs.getStringList(key) as T;
    } else {
      throw Exception('Invalid Key');
    }
  }
}
