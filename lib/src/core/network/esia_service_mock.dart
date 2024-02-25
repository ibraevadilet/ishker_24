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
    await Future.delayed(const Duration(seconds: 1));

    return '';
  }

  Future<AuthModel> auth(AuthRequestBody body) async {
    final Map<String, dynamic> data = {
      "requestId": "f0f355c8-eb38-4b26-ac0c-23c3c89af272",
      "body": [
        {
          "method": "Telegram",
          "enabled": false,
          "phoneNumberFragment": null,
          "emailFragment": null
        },
        {
          "method": "Email",
          "enabled": true,
          "phoneNumberFragment": null,
          "emailFragment": "u********m@gmail.com"
        },
        {
          "method": "Sms",
          "enabled": true,
          "phoneNumberFragment": "+99655*****76",
          "emailFragment": null
        }
      ],
      "errors": null,
      "succeeded": true,
      "twoFactorSessionToken":
          "CfDJ8DVWRrhIBSdLuSzJI7yO2I3erH62TxrOCXlo5EK3Grqi1seqD9HNQMtBSh9krzDBddhZ5BT4Qd9BWekayUZOtBydKwyIxvA0zsNGGbH9YS5Lrf7DrNAKC1qVHruCmYpzWhjz6Gf9mPgllBudfZkgYdZh5T2Xh_yqsqMXWyM16nSHJqEwg6aXfda-e_4GXiWpLpaWh-y89GPDjVaxzihEtK1hR7mMy2Wc2NVAO47VZyopfCdCRTzVqLBSJYMdLxRO5pIq9roMLGaasVgGQ10LweU"
    };

    return AuthModel.fromJson(data);
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

  Future<void> setNewPinCode(
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

  Future<void> enterPinCode(String deviceId, String pin, String pinCode) async {
    final Map<String, dynamic> data = {
      "accessToken":
          "eyJhbGciOiJSUzI1NiIsImtpZCI6IkNCRDg2OENFQzVBRUMwMDA3Q0EwRDQ1ODNBOUQ1NEUwIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE3MDg3NzM2NDQsImV4cCI6MTcwODc3NzI0NCwiaXNzIjoiaHR0cHM6Ly9lc2lhLnR1bmR1ay5rZyIsImNsaWVudF9pZCI6IlBTX01lZ2FQYXkiLCJzdWIiOiIyMjEzMjQyIiwiYXV0aF90aW1lIjoxNzA4NzczNjQ0LCJpZHAiOiJsb2NhbCIsImp0aSI6IkUxODE4MUU5OEFENzJCNDU3NTA5NUE3OENFQzI2ODM5IiwiaWF0IjoxNzA4NzczNjQ0LCJzY29wZSI6WyJkZXZpY2VfYXBpIiwiZW1haWwiLCJJZGVudGl0eVNlcnZlckFwaSIsIm9wZW5pZCIsInBob25lIiwicHJvZmlsZSJdLCJhbXIiOlsicHdkIl19.rPk0cOQoxCDl4bhiqm-sk2oT_KWy2s-JtPaHnf-GfEikMwVaF7fphFoNfVWWgqN98Ay5pEzKyUD-CDDTvH1YHQguBY8x0qIPKQyZwFvEfgIbDCtezPbLfX5zt6FvAsZbWMYh-dWZ-pyMG4eaS6ws5EoUNoA4G_I-L5zwV_F5K1hr-HqqccUKnvyEwow-Ot4P2o-e0RWddkuWGh0zpGmye51IBOjTLzLRQXGHxtWQWrF6Pa56xuDSl-OtMbgH126S88XX1tF2URNB-sjnulBNVviEHGOIokeG6BP2FRKCDM5v6wqLUx0BZke_E8x7aoW6J-ma_aBH0Nxx1RB4cpYpNw",
      "expiresIn": 3600,
      "tokenType": "Bearer",
      "scope": "device_api email IdentityServerApi openid phone profile",
      "error": null,
      "errorDescription": null
    };
  }

  Future<void> getConfirmCode(
    String method,
    String twoFactorSessionToken,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    // final data = {
    //   "requestId": "b429d15d-305b-46c5-b107-43703f9de776",
    //   "succeeded": true,
    //   "errors": null
    // };

    return;
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
    final Map<String, dynamic> data = {
      "requestId": "aa043045-ce37-44f8-90ab-a2606d4d5cb2",
      "body": {
        "persistentSessionToken":
            "gLe8iN/Ft&rLrg5vhnW75_Mv(a84YtSn5ButK-F=(kTuvvBjWb%i/mKcOvz^ZzCX",
        "signInResult": "Succeeded"
      },
      "errors": null,
      "succeeded": true
    };

    return GetConfirmCodeModel.fromJson(data['body']);
  }
}
