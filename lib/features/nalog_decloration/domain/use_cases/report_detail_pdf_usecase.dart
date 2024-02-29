import 'package:ishker_24/features/nalog_decloration/domain/repositories/report_detail_pdf_repository.dart';

class ReportDetailPdfUseCase {
  final ReportDetailPdfRepo repo;
  ReportDetailPdfUseCase({
    required this.repo,
  });

  Future<String> reportDetailPdf(String reportId) async {
    try {
      return await repo.reportDetailPdf(reportId);
    } catch (e) {
      rethrow;
    }
  }
}
