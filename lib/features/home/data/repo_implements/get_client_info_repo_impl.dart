import 'package:dio/dio.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/repositories/get_client_info_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class GetClientInfoRepoImpl implements GetClientInfoRepo {
  final Dio dio;
  GetClientInfoRepoImpl({required this.dio});

  @override
  Future<ClientInfoModel> getClientInfo() async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    try {
      final response = await dio.post(
        'rsk-service/client/information',
        data: {'pin': isSavedPin},
      );
      return ClientInfoModel.fromJson(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
