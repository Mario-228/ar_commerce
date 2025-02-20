// import 'package:shared_preferences/shared_preferences.dart';

// abstract class CacheHelper {
//   static Future<void> saveData<T>(String key, T value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (value is String) {
//       await prefs.setString(key, value);
//     } else if (value is int) {
//       await prefs.setInt(key, value);
//     } else if (value is double) {
//       await prefs.setDouble(key, value);
//     } else if (value is bool) {
//       await prefs.setBool(key, value);
//     } else if (value is List<String>) {
//       await prefs.setStringList(key, value);
//     } else {
//       throw Exception('Invalid value type');
//     }
//   }

//   static Future<T?> getData<T>(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (T == String) {
//       return prefs.getString(key) as T?;
//     } else if (T == int) {
//       return prefs.getInt(key) as T?;
//     } else if (T == double) {
//       return prefs.getDouble(key) as T?;
//     } else if (T == bool) {
//       return prefs.getBool(key) as T?;
//     } else if (T == List<String>) {
//       return prefs.getStringList(key) as T?;
//     } else {
//       throw Exception('Unsupported type');
//     }
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import '../functions/convert_asset_image_to_file.dart';
import 'cache_helper_keys.dart';

abstract class CacheHelper {
  static Future<void> saveData<T>(String key, T value) async {
    var box = await Hive.openBox('appBox');

    if (value is String) {
      await box.put(key, value);
    } else if (value is int) {
      await box.put(key, value);
    } else if (value is double) {
      await box.put(key, value);
    } else if (value is bool) {
      await box.put(key, value);
    } else if (value is List<String>) {
      await box.put(key, value);
    } else {
      throw Exception('Invalid value type');
    }

    await box.close();
  }

  static Future<T?> getData<T>(String key) async {
    var box = await Hive.openBox('appBox');

    var value = box.get(key);
    await box.close();

    if (value is T) {
      return value;
    } else {
      return null;
    }
  }

  static Future<void> saveUserImage(File image) async {
    var box = await Hive.openBox('appBox');
    Uint8List bytes = await image.readAsBytes();
    await box.put(CacheHelperKeys.userImage, bytes);
  }

  static Future<File> getUserImage() async {
    var box = await Hive.openBox('appBox');
    if (box.get(CacheHelperKeys.userImage) == null) {
      // imageFile = await convertAssetImageToFile(
      //     "assets/images/user_default_image.jpg", 'default_user_image.png');
      //imageFile=
      return convertAssetImageToFile(
          "assets/images/user_default_image.jpg", 'default_user_image.png');
    }
    Uint8List bytes = await box.get(CacheHelperKeys.userImage);
    await box.close();
    return File.fromRawPath(bytes);
  }
}
