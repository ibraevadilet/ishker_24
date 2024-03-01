import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/esf/domain/repositories/save_token_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class SaveTokenRepoImpl implements SaveTokenRepo {
  final Dio dio;
  SaveTokenRepoImpl({required this.dio});

  @override
  Future<void> saveToken({
    required String data,
    required bool isFile,
    String? fileName,
  }) async {
    final pin = AppSavedPin.getPin();

    Map<String, dynamic> sendData = {'tin': pin};
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
