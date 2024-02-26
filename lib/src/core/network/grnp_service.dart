import 'package:dio/dio.dart';
import 'package:ishker_24/src/features/auth/data/models/send_grnp_model.dart';

class GRNPService {
  GRNPService(this._dio);

  final Dio _dio;

  Future<bool> checkGrnp(String pin) async {
    final response = await _dio.get(
      'grnp/check-existing-db',
      queryParameters: {'inn': pin},
    );

    return response.data;
  }

  Future<String> sendGRNP(SendGRNPModel model, String phone) async {
    final response = await _dio.post(
      'grnp/passportdata',
      queryParameters: {'phone': phone},
      data: model.toJson(),
    );

    return response.data;
  }
}
