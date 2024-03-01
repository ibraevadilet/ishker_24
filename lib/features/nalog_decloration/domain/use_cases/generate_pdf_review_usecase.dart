import 'package:ishker_24/features/nalog_decloration/domain/repositories/generate_pdf_review_repository.dart';

class GeneratePdfReviewUseCase {
  final GeneratePdfReviewRepo repo;
  GeneratePdfReviewUseCase({
    required this.repo,
  });

  Future<String> generatePdfReview(
      Map<String, dynamic> sendModel, String type) async {
    try {
      return await repo.generatePdfReview(sendModel, type);
    } catch (e) {
      rethrow;
    }
  }
}
