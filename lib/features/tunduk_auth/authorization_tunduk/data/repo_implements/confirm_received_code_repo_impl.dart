import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/get_confirm_code_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_confirm_code_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/confirm_received_code_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ConfirmReceivedCodeRepoImpl implements ConfirmReceivedCodeRepo {
  final Dio dio;
  ConfirmReceivedCodeRepoImpl({required this.dio});

  @override
  Future<GetConfirmCodeModel> confirmReceivedCode(
      SendConfirmCodeModel model) async {
    try {
      final response = await dio.post(
        options: AppDioHeader.dioHeader(),
        'esia/login',
        data: model.toJson(),
      );
      return GetConfirmCodeModel.fromJson(response.data['body']);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          throw CatchException(
            message: e.response!.data['body']['signInResult'],
          ).message;
        }
      }
      throw CatchException.convertException(e).message;
    }
  }
}
