import 'package:dio/dio.dart';
import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class CreateAccountRepoImpl implements CreateAccountRepo {
  final Dio dio;
  CreateAccountRepoImpl({required this.dio});

  @override
  Future<void> createAccount() async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    try {
      await dio.post(
        'rsk-service/account/create',
        data: {
          'pin': isSavedPin,
          'bic': 'bic',
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
