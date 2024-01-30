import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final Dio dio;
  ResetPasswordRepoImpl({required this.dio});

  @override
  Future<void> resetPassword({
    required String pin,
    required String contact,
    required String method,
  }) async {
    final sendData = method == 'sms'
        ? {
            'pin': pin,
            'phoneNumber': contact,
          }
        : {
            'pin': pin,
            'email': contact,
          };

    try {
      await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/$method/reset-password',
        data: sendData,
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
