import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/home/domain/repository/check_has_ip_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

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
}
