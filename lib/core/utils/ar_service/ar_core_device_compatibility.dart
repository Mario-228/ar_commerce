import 'dart:developer';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

abstract class ArCoreDeviceCompatibility {
  static late bool isArSupported;
  static Future<void> checkDeviceCompatibility() async {
    isArSupported = await ArCoreController.checkArCoreAvailability();

    if (isArSupported) {
      log('✅ ARCore is supported');
    } else {
      log('❌ ARCore not supported');
    }
  }
}
