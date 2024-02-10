import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/repositories/generate_qr_repository.dart';

class GenerateQrUseCase {
  final GenerateQrRepo repo;
  GenerateQrUseCase({
    required this.repo,
  });

  Future<String> generateQr(GenerateQrPostModel model) async {
    try {
      return await repo.generateQr(model);
    } catch (e) {
      rethrow;
    }
  }
}
