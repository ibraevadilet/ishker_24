import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/data/models/get_client_passport_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/get_client_passport_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class GetClientPassportRepoImpl implements GetClientPassportRepo {
  final Dio dio;
  GetClientPassportRepoImpl({required this.dio});

  @override
  Future<ClientPassportModel> getClientPassport() async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    try {
      final response = await dio.post(
        'rsk-service/client/passport',
        data: {
          'pin': isSavedPin,
        },
      );
      return ClientPassportModel.fromMap(response.data['data']);
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
