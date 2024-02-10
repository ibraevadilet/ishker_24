import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/home/domain/repositories/check_has_ip_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class CheckHasIPRepoImpl implements CheckHasIPRepo {
  final Dio dio;
  CheckHasIPRepoImpl({required this.dio});
  @override
  Future<CheckHasIPModel> checkHasIP() async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      final response = await dio.get(
        'gns/get/registration-status',
        queryParameters: {
          'deviceId': deviceId,
        },
      );
      return response.data;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<bool> checkHasBank() async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }

    try {
      final response = await dio.post(
        'rsk-service/client/check',
        data: {
          'pin': '20708199432405',
        },
      );
      return response.data['data']['clientExists'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
