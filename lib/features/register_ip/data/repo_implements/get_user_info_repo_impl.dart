import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/register_ip/data/models/get_user_info_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_user_info_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserInfoRepoImpl implements GetUserInfoRepo {
  final Dio dio;
  final SharedPreferences pref;
  GetUserInfoRepoImpl({required this.dio, required this.pref});

  @override
  Future<GetUserInfoModel> getUserInfo() async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      final response = await dio.get(
        'gns/get-user-info',
        queryParameters: {
          'deviceId': deviceId,
        },
      );
      return GetUserInfoModel.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
