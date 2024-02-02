import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/splash/data/models/exists_user_model.dart';
import 'package:ishker_24/features/splash/domain/repositories/exists_user_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ExistsUserRepoImpl implements ExistsUserRepo {
  final Dio dio;
  ExistsUserRepoImpl({required this.dio});

  @override
  Future<ExistsUserModel> existsUser(String deviceId) async {
    try {
      final response = await dio.get(
        options: AppDioHeader.dioHeader(),
        'esia/check-user',
        queryParameters: {
          'deviceId': deviceId,
        },
      );
      return ExistsUserModel.fromJson(response.data);
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
