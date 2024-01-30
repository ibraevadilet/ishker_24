import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/exit_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ExitRepoImpl implements ExitRepo {
  final Dio dio;
  ExitRepoImpl({required this.dio});

  @override
  Future<void> exit() async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      await dio.get(
        options: AppDioHeader.dioHeader(),
        'esia/exit',
        queryParameters: {'deviceId': deviceId},
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
