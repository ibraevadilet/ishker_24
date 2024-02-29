import 'package:ishker_24/features/nalog_decloration/data/models/my_reports_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_my_reports_repository.dart';

class GetMyReportsUseCase {
  final GetMyReportsRepo repo;
  GetMyReportsUseCase({
    required this.repo,
  });

  Future<List<ReportDoneModel>> getMyReports() async {
    try {
      return await repo.getMyReports();
    } catch (e) {
      rethrow;
    }
  }
}
