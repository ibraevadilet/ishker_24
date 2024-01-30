import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/set_reset_pin_code_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class SendResetPinCodeRepoImpl implements SendResetPinCodeRepo {
  final Dio dio;
  SendResetPinCodeRepoImpl({required this.dio});

  @override
  Future<String> sendResetPinCode({
    required String password,
    required String method,
    required String deviceId,
    required String deviceName,
  }) async {
    try {
      final response = await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/reset-pincode',
        data: {
          'password': password,
          'deviceId': deviceId,
          'deviceName': deviceName,
          'method': method,
        },
      );
      return response.data['body']['userId'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
