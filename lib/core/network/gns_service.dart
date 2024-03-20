import 'package:dio/dio.dart';
import 'package:ishker_24/features/rsk/client/data/models/has_ip_model.dart';

class GnsService {
  GnsService(this._dio);

  final Dio _dio;

  Future<HasIPModel?> checkHasIP(String deviceId) async {
    final response = await _dio.get(
      'gns/get/registration-status',
      queryParameters: {'deviceId': deviceId},
    );

    return response.data.isEmpty
        ? null
        : response.data['data']['qrUrl'] == null &&
                response.data['data']['gnsStatus'] == null
            ? HasIPModel.fromJsonNoCertificate(response.data['data'])
            : HasIPModel.fromJsonCertificate(response.data['data']);
  }
}
