import 'package:dio/dio.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/repositories/generate_qr_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GenerateQrRepoImpl implements GenerateQrRepo {
  final Dio dio;
  GenerateQrRepoImpl({required this.dio});

  @override
  Future<String> generateQr(GenerateQrPostModel model) async {
    try {
      final response = await dio.post(
        'rsk-service/qr/generate',
        data: {},
      );
      return response.data['data']['link'];
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
