import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';
import 'package:ishker_24/src/features/auth/data/models/ishker_auth_model.dart';

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<IshkerAuthModel> getToken(String deviceId, String pin) async {
    final response = await _dio.get(
      'security/auth/tokens',
      options: AppDioHeader.dioHeader(),
      queryParameters: {'pin': pin, 'device_id': deviceId},
    );

    return IshkerAuthModel.fromJson(response.data);
  }
}
