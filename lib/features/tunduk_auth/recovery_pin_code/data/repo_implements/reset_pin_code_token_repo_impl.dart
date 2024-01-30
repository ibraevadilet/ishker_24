import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/reset_pin_code_token_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ResetPinCodeTokenRepoImpl implements ResetPinCodeTokenRepo {
  final Dio dio;
  ResetPinCodeTokenRepoImpl({required this.dio});

  @override
  Future<String> resetPinCodeToken(String verificationCode) async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      final response = await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/reset-pincode-token',
        data: {
          'deviceId': deviceId,
          'verificationCode': verificationCode,
        },
      );
      return response.data['body']['resetPinCodeToken'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
