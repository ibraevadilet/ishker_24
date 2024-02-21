import 'package:dio/dio.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';

class RskService {
  RskService(this.dio);

  final Dio dio;

  Future<String> generateQR(GenerateQrPostModel model) async {
    final response = await dio.post(
      'rsk-service/qr/generate',
      data: model.toJson(),
    );

    return response.data['data']['link'];
  }
}
