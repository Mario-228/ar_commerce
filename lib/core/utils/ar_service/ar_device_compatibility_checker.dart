import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper_keys.dart';

abstract class ARDeviceCompatibilityChecker {
  static late bool isARSupported;

  static Future<List<Map<String, dynamic>>> loadDeviceList() async {
    final jsonString = await rootBundle
        .loadString('assets/arcore_supported_devices/devices_table_list.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }

  /// Get the model name of the current Android device
  static Future<String> getDeviceModel() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
    return 'device is not android';
  }

  static Future<String> getDeviceBrand() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.brand;
    }
    return 'device is not android';
  }

  /// Check if the device model exists in the ARCore-supported list
  static Future<bool> isDeviceSupported() async {
    final model = await getDeviceModel();
    final brand = await getDeviceBrand();
    final deviceList = await loadDeviceList();
    log('Device Model: $model');
    log('Device Brand: $brand');
    isARSupported = deviceList.any((device) =>
        device["Model Name"] != null &&
        device["Model Name"].toString().toLowerCase() == model.toLowerCase() &&
        device["Brand"] != null &&
        device["Brand"].toString().toLowerCase() == brand.toLowerCase());
    if (isARSupported) {
      log('✅ ARCore is supported');
    } else {
      log('❌ ARCore not supported');
    }
    await CacheHelper.saveData<bool>(
        CacheHelperKeys.isSupported, isARSupported);
    return isARSupported;
  }

  static Future<void> isDeviceARCoreSupported() async {
    bool? isDeviceARSupported =
        CacheHelper.getData<bool>(CacheHelperKeys.isSupported);
    if (isDeviceARSupported != null) {
      isARSupported = isDeviceARSupported;
    } else {
      await isDeviceSupported();
    }
  }
}
