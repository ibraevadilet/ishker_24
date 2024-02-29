import 'package:dio/dio.dart';
import 'package:ishker_24/features/esf/domain/repositories/save_token_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:ishker_24/server/service_locator.dart';

class SaveTokenRepoImpl implements SaveTokenRepo {
  final Dio dio;
  SaveTokenRepoImpl({required this.dio});

  @override
  Future<void> saveToken({
    required String data,
    required bool isFile,
    String? fileName,
  }) async {
    String isSavedPin = sl<ExistsUserUseCase>().pin;
    if (isSavedPin.isEmpty) {
      isSavedPin = sl<AuthUseCase>().inn;
    }

    Map<String, dynamic> sendData = {'tin': isSavedPin};
    FormData formData = FormData.fromMap({});
    if (isFile) {
      formData.files.add(
        MapEntry(
          "file",
          MultipartFile.fromFileSync(
            data,
            filename: fileName,
          ),
        ),
      );
    } else {
      sendData.addEntries(
        {"token": data}.entries,
      );
    }
    try {
      await dio.post(
        'esf/gns/api/v1/save-token',
        queryParameters: sendData,
        data: isFile ? formData : null,
      );
    } catch (e) {
      if (e is DioException) {
        throw CatchException(message: e.response!.data.toString()).message;
      }
    }
  }
}
