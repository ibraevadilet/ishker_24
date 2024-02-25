import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/constants/constants.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';
import 'package:ishker_24/src/features/auth/data/models/auth_model.dart';
import 'package:ishker_24/src/features/auth/data/models/auth_request_model.dart';
import 'package:ishker_24/src/features/auth/data/models/get_confirm_code_model.dart';
import 'package:ishker_24/src/features/auth/data/models/send_confirm_code_model.dart';

class EsiaService {
  EsiaService(this.dio);

  final Dio dio;

  Future<String> userExists(String deviceId) async {
    final response = await dio.get(
      options: AppDioHeader.dioHeader(),
      'esia/check-user',
      queryParameters: {'deviceId': deviceId},
    );

    return response.data;
  }

  Future<AuthModel> auth(AuthRequestBody body) async {
    final response = await dio.post(
      options: AppDioHeader.dioHeader(),
      'esia/check',
      data: body.toJson(),
    );

    return AuthModel.fromJson(response.data);
  }

  Future<void> setPinCode(String persistentSessionToken, String pin) async {
    await dio.post(
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
  }

  Future<void> pinCodeEnter(String deviceId, String pin, String pinCode) async {
    await dio.get(
      'esia/connection',
      options: AppDioHeader.dioHeader(),
      queryParameters: {'deviceId': deviceId, 'pinCode': pinCode},
    );
  }

  Future<void> getConfirmCode(
    String method,
    String twoFactorSessionToken,
  ) async {
    await dio.post(
      'esia/send-code/$method',
      options: AppDioHeader.dioHeader(),
      data: {'twoFactorSessionToken': twoFactorSessionToken},
    );
  }

  Future<void> exit(String deviceId) async {
    await dio.get(
      'esia/exit',
      options: AppDioHeader.dioHeader(),
      queryParameters: {'deviceId': deviceId},
    );
  }

  //TODO: 404
  Future<String> esiaGetTerms(String path) async {
    await dio.download(
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
    final response = await dio.post(
      'esia/login',
      options: AppDioHeader.dioHeader(),
      data: model.toJson(),
    );

    return GetConfirmCodeModel.fromJson(response.data['body']);
  }
}
