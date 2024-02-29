import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_static_fields_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class GetStaticFieldsRepoImpl implements GetStaticFieldsRepo {
  final Dio dio;
  GetStaticFieldsRepoImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getStaticFields(String type) async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }
    isSavedPin = '21605200001255';
    try {
      final response = await dio.get(
        'declaration/ishker/user/info',
        queryParameters: {
          'type': type,
          'inn': isSavedPin,
        },
      );
      return response.data['data'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
