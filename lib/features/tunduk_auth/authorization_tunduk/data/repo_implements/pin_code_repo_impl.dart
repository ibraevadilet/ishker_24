import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class PinCodeRepoImpl implements PinCodeRepo {
  final Dio dio;
  PinCodeRepoImpl({required this.dio});

  @override
  Future<String> enterPinCode(String pinCode) async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      final response = await dio.get(
        options: AppDioHeader.dioHeader(),
        'esia/connection',
        queryParameters: {
          'deviceId': deviceId,
          'pinCode': pinCode,
        },
      );
      return response.data['accessToken'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<String> setPinCode(String persistentSessionToken, String pin) async {
    try {
      await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/set-pincode',
        data: {
          'persistentSessionToken': persistentSessionToken,
          'pinCode': pin,
          'pinCodeConfirmation': pin,
        },
      );
      return await enterPinCode(pin);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<String> setNewPinCode(String resetPinCodeToken, String pinCode) async {
    final deviceId = await AppDeviceInfo.deviceId();

    try {
      await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/set-new-pincode',
        data: {
          'deviceId': deviceId,
          'resetPinCodeToken': resetPinCodeToken,
          'pinCode': pinCode,
          'verifyPinCode': pinCode,
        },
      );
      return await enterPinCode(pinCode);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
