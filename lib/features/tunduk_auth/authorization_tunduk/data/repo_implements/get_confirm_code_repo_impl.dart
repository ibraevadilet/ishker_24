import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/get_confirm_code_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetConfirmCodeRepoImpl implements GetConfirmCodeRepo {
  final Dio dio;
  GetConfirmCodeRepoImpl({required this.dio});

  @override
  Future<void> getConfirmCode({
    required String method,
    required String twoFactorSessionToken,
  }) async {
    try {
      await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/send-code/$method',
        data: {
          'twoFactorSessionToken': twoFactorSessionToken,
        },
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          if (e.response!.data['errors'][0]['code'] == 'SmsHasBeenSended') {
            throw CatchException(message: 'sms code был отправлен').message;
          }
        }
      }
      throw CatchException.convertException(e).message;
    }
  }
}
