import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AppDeviceInfo {
  static Future<String> deviceId() async {
    String uniqueDeviceId = '';

    if (Platform.isIOS) {
      var deviceInfo = DeviceInfoPlugin();
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId =
          '${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
    } else if (Platform.isAndroid) {
      const androidIdPlugin = AndroidId();
      final String? androidId = await androidIdPlugin.getId();
      uniqueDeviceId = '$androidId'; // unique ID on Android
    }
    return uniqueDeviceId;
  }

  static deviceName() async {
    String deviceName = '';
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceName = iosDeviceInfo.name;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.iosInfo;
      deviceName = androidDeviceInfo.name;
    }
    return deviceName;
  }
}
