import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';

import 'dart:developer' as dev;

class AppDeviceInfo {
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
