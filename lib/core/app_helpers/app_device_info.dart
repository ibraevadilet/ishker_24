import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'dart:developer' as dev;

import 'package:ishker_24/core/errors/exceptions.dart';

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
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceName = androidDeviceInfo.brand;
    }
    return deviceName;
  }
}

class AppDeviceInfoX {
  late String name;
  late String id;

  Future<void> init() async {
    final info = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosInfo = await info.iosInfo;
      id = '${iosInfo.identifierForVendor}'; // unique ID on iOS
      name = iosInfo.name;
    } else if (Platform.isAndroid) {
      const androidIdPlugin = AndroidId();
      final String? androidId = await androidIdPlugin.getId();
      id = '$androidId'; // unique ID on Android
      // name = (await info.androidInfo).brand;
      final ainfo = await info.androidInfo;
      name = ainfo.brand;
    } else {
      throw UnsupportedPlatformException();
    }

    dev.log('deviceId: $id | deviceName: $name');
  }
}
