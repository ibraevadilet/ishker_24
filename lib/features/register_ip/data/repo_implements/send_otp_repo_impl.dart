import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/register_ip/data/models/user_nalog_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/send_otp_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendOtpRepoImpl implements SendOtpRepo {
  final Dio dio;
  final SharedPreferences pref;
  SendOtpRepoImpl({required this.dio, required this.pref});

  @override
  Future<void> sendOtp(String authType) async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      await dio.get(
        'gns/send-otp',
        queryParameters: {
          'authType': authType,
          'deviceId': deviceId,
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<String> confirmOtp(
    String pinCode,
    UserNalogTypesModel registerModel,
  ) async {
    try {
      final response = await dio.post(
        'gns/verify-code-and-register',
        queryParameters: {'byPin': pinCode},
        options: Options(
          headers: {
            'authorization': 'Bearer ${pref.getString(
                  SharedKeys.accessToken,
                ) ?? ''} ',
          },
        ),
        data: registerModel.toJson(),
      );
      if (response.data['status'] == 'ERROR') {
        return response.data['message'];
      } else {
        return 'SUCCESS';
      }
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
