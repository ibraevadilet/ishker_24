import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/constants/constants.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';
import 'package:ishker_24/src/features/auth/data/models/auth_model.dart';
import 'package:ishker_24/src/features/auth/data/models/auth_request_model.dart';
import 'package:ishker_24/src/features/auth/data/models/get_confirm_code_model.dart';
import 'package:ishker_24/src/features/auth/data/models/send_confirm_code_model.dart';
import 'package:ishker_24/src/features/recovery/data/models/reset_pass_token_model.dart';

class EsiaService {
  EsiaService(this._dio);

  final Dio _dio;

  Future<String> userExists(String deviceId) async {
    final response = await _dio.get(
      options: AppDioHeader.dioHeader(),
      'esia/check-user',
      queryParameters: {'deviceId': deviceId},
    );

    return response.data;
  }

  Future<AuthModel> auth(AuthRequestBody body) async {
    final response = await _dio.post(
      options: AppDioHeader.dioHeader(),
      'esia/check',
      data: body.toJson(),
    );

    return AuthModel.fromJson(response.data);
  }

  Future<void> setPinCode(String persistentSessionToken, String pin) async {
    await _dio.post(
      options: AppDioHeader.dioHeader(),
      'esia/set-pincode',
      data: {
        'persistentSessionToken': persistentSessionToken,
        'pinCode': pin,
        'pinCodeConfirmation': pin,
      },
    );
  }

  Future<void> pinCodeChange(
    String deviceId,
    String resetPinCodeToken,
    String pinCode,
  ) async {
    await _dio.post(
      options: AppDioHeader.dioHeader(),
      'esia/set-new-pincode',
      data: {
        'deviceId': deviceId,
        'resetPinCodeToken': resetPinCodeToken,
        'pinCode': pinCode,
        'verifyPinCode': pinCode,
      },
    );
  }

  Future<void> pinCodeEnter(String deviceId, String pin, String pinCode) async {
    await _dio.get(
      'esia/connection',
      options: AppDioHeader.dioHeader(),
      queryParameters: {'deviceId': deviceId, 'pinCode': pinCode},
    );
  }

  Future<void> getConfirmCode(
    String method,
    String twoFactorSessionToken,
  ) async {
    await _dio.post(
      'esia/send-code/$method',
      options: AppDioHeader.dioHeader(),
      data: {'twoFactorSessionToken': twoFactorSessionToken},
    );
  }

  Future<void> exit(String deviceId) async {
    await _dio.get(
      'esia/exit',
      options: AppDioHeader.dioHeader(),
      queryParameters: {'deviceId': deviceId},
    );
  }

  //TODO: 404
  Future<String> esiaGetTerms(String path) async {
    await _dio.download(
      AppTextConstants.esiUserStatement,
      path,
      options: Options(
        method: 'GET',
        headers: {'Authorization': AppEncode.encode64Basic()},
      ),
    );

    return path;
  }

  Future<GetConfirmCodeModel> confirmReceivedCode(
    SendConfirmCodeModel model,
  ) async {
    final response = await _dio.post(
      'esia/login',
      options: AppDioHeader.dioHeader(),
      data: model.toJson(),
    );

    return GetConfirmCodeModel.fromJson(response.data['body']);
  }

  Future<void> resetPassword(String pin, String contact, String method) async {
    final sendData = method == 'sms'
        ? {'pin': pin, 'phoneNumber': contact}
        : {'pin': pin, 'email': contact};

    await _dio.post(
      'esia/$method/reset-password',
      options: AppDioHeader.dioHeader(),
      data: sendData,
    );
  }

  Future<ResetPasswordTokenModel> resetPasswordToken(
    String pin,
    String otp,
  ) async {
    final response = await _dio.post(
      'esia/reset-password-token',
      options: AppDioHeader.dioHeader(),
      data: {'pin': pin, 'otp': otp},
    );

    return ResetPasswordTokenModel.fromJson(response.data['body']);
  }

  Future<void> setNewPassword(
    String userId,
    String token,
    String password,
  ) async {
    await _dio.post(
      'esia/set-new-password',
      options: AppDioHeader.dioHeader(),
      data: {
        'userId': userId,
        'token': token,
        'password': password,
        'newPassword': password,
      },
    );
  }
}
