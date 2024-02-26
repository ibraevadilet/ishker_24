import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/constants/constants.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';
import 'package:ishker_24/src/features/signup/data/models/oep_register_model.dart';

class OepService {
  OepService(this._dio);

  final Dio _dio;

  Future<String> registerOEP(OepRegisterModel model) async {
    String result = '';

    final response = await _dio.post(
      'oep-service/register/generate',
      options: AppDioHeader.dioHeader(),
      data: model.toJson(),
    );
    print(response.data['code'] != null && response.data['code'] == 409);
    if (response.data['code'] != null && response.data['code'] == 409) {
      result = response.data['message'];
    }
    return result;
  }

  Future<String> getTerms(String path) async {
    await _dio.download(
      '${AppTextConstants.userStatement}ru',
      path,
      options: Options(
        method: 'GET',
        headers: {'Authorization': AppEncode.encode64Basic()},
      ),
    );

    return path;
  }
}
