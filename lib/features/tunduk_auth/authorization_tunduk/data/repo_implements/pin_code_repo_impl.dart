import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/splash/data/models/ishker_auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class PinCodeRepoImpl implements PinCodeRepo {
  final Dio dio;
  PinCodeRepoImpl({required this.dio});

  @override
  Future<IshkerAuthModel> enterPinCode(String pinCode) async {
    final deviceId = await AppDeviceInfo.deviceId();
    final pin = AppSavedPin.getPin();
    try {
      await dio.get(
        options: AppDioHeader.dioHeader(),
        'esia/connection',
        queryParameters: {
          'deviceId': deviceId,
          'pinCode': pinCode,
        },
      );

      return await getToken(deviceId, pin);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<IshkerAuthModel> setPinCode(
      String persistentSessionToken, String pin) async {
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
  Future<IshkerAuthModel> setNewPinCode(
      String resetPinCodeToken, String pinCode) async {
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

  @override
  Future<IshkerAuthModel> getToken(String deviceId, String pin) async {
    try {
      final response = await dio.get(
        'security/auth/tokens',
        queryParameters: {
          'pin': pin,
          'device_id': deviceId,
        },
        options: AppDioHeader.dioHeader(),
      );
      return IshkerAuthModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
