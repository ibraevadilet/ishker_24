import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/set_new_password_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class SetNewPasswordRepoImpl implements SetNewPasswordRepo {
  final Dio dio;
  SetNewPasswordRepoImpl({required this.dio});

  @override
  Future<void> setNewPassword({
    required String userId,
    required String token,
    required String password,
  }) async {
    try {
      await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/set-new-password',
        data: {
          'userId': userId,
          'token': token,
          'password': password,
          'newPassword': password,
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
