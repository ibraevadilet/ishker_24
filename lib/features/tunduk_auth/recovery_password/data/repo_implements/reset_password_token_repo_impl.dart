import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/data/models/reset_password_token_model.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_token_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ResetPasswordTokenRepoImpl implements ResetPasswordTokenRepo {
  final Dio dio;
  ResetPasswordTokenRepoImpl({required this.dio});

  @override
  Future<ResetPasswordTokenModel> resetPasswordToken(
      String pin, String otp) async {
    try {
      final response = await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/reset-password-token',
        data: {
          'pin': pin,
          'otp': otp,
        },
      );
      return ResetPasswordTokenModel.fromJson(response.data['body']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
