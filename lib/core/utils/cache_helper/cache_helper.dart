import 'dart:io';
import 'dart:typed_data';
import 'package:graduation_project_new_version/features/login_feature/data/models/login_output_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../functions/convert_asset_image_to_file.dart';
import 'cache_helper_keys.dart';

abstract class CacheHelper {
  static Box? _box;

  static Future<void> init() async {
    if (!Hive.isBoxOpen('appBox')) {
      _box = await Hive.openBox('appBox');
    } else {
      _box = Hive.box('appBox');
    }
  }

  static Box get _getBox {
    if (_box == null) {
      throw Exception(
          "CacheHelper not initialized. Call CacheHelper.init() first.");
    }
    return _box!;
  }

  static Future<void> saveData<T>(String key, T value) async {
    await _getBox.put(key, value);
  }

  static T? getData<T>(String key) {
    var value = _getBox.get(key);
    if (value is T) {
      return value;
    } else {
      return null;
    }
  }

  static LoginOutputModel getUserData() {
    var value = _getBox.get(CacheHelperKeys.userInfo);
    // safe cast to Map<String, dynamic>
    final map = Map<String, dynamic>.from(value);
    return LoginOutputModel.fromJson(map);
  }

  static Future<void> saveUserImage(File image) async {
    Uint8List bytes = await image.readAsBytes();
    await _getBox.put(CacheHelperKeys.userImage, bytes);
  }

  static Future<File> getUserImage() async {
    if (_getBox.get(CacheHelperKeys.userImage) == null) {
      return convertAssetImageToFile(
          "assets/images/user_default_image.jpg", 'default_user_image.png');
    }
    Uint8List bytes = _getBox.get(CacheHelperKeys.userImage);
    return File.fromRawPath(bytes);
  }
}
