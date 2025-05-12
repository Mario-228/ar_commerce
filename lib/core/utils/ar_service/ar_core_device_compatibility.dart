import 'dart:developer';

// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

abstract class ArCoreDeviceCompatibility {
  static late bool isArSupported;
  static Future<void> checkDeviceCompatibility() async {
    // isArSupported = await ArCoreController.checkArCoreAvailability();
    isArSupported = true; // for testing the run without ARCore
    //To enable ARCore remove the comment from pubspec.yaml and comment line 9 , and uncomment line 8
    if (isArSupported) {
      log('✅ ARCore is supported');
    } else {
      log('❌ ARCore not supported');
    }
  }
}
