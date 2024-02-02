import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/splash/domain/repositories/exists_user_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ExistsUserRepoImpl implements ExistsUserRepo {
  final Dio dio;
  ExistsUserRepoImpl({required this.dio});

  String pin = '';

  @override
  Future<String> existsUser(String deviceId) async {
    try {
      final response = await dio.get(
        options: AppDioHeader.dioHeader(),
        'esia/check-user',
        queryParameters: {
          'deviceId': deviceId,
        },
      );

      if (response.data != '') {
        pin = response.data['pin'];
      }
      return pin;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  // @override
  // Future<IshkerAuthModel> getToken(String deviceId, String pin) async {
  //   try {
  //     final response = await dio.get(
  //       'security/auth/tokens',
  //       queryParameters: {
  //         'pin': pin,
  //         'deviceId': deviceId,
  //       },
  //       options: AppDioHeader.dioHeader(),
  //     );
  //     return IshkerAuthModel.fromJson(response.data);
  //   } catch (e) {
  //     throw CatchException.convertException(e).message;
  //   }
  // }
}
