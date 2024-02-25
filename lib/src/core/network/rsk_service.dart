import 'package:dio/dio.dart';

class RskService {
  RskService(this.dio);

  final Dio dio;

  // Future<String> generateQR(GenerateQrPostModel model) async {
  //   final response = await dio.post(
  //     'rsk-service/qr/generate',
  //     data: model.toJson(),
  //   );

  //   return response.data['data']['link'];
  // }
}
