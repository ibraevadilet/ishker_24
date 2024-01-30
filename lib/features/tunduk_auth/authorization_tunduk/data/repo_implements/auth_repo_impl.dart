import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_for_auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/auth_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class AuthRepoImpl implements AuthRepo {
  final Dio dio;
  AuthRepoImpl({required this.dio});

  @override
  Future<AuthModel> auth(SendForAuthModel model) async {
    try {
      final response = await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/check',
        data: model.toJson(),
      );
      return AuthModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          throw CatchException(
                  message: e.response!.data['twoFactorSessionToken'])
              .message;
        }
      }
      throw CatchException.convertException(e).message;
    }
  }
}
