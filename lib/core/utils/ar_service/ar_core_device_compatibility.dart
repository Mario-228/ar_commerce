import 'dart:developer';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class ArCoreDeviceCompatibility {
  Future<bool> checkDeviceCompatibility() async {
    bool arCoreSupported = await ArCoreController.checkArCoreAvailability();

    if (arCoreSupported) {
      log('✅ ARCore is supported');
    } else {
      log('❌ ARCore not supported');
    }
    return arCoreSupported;
  }
}
