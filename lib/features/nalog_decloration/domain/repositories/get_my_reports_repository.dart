import 'package:ishker_24/features/nalog_decloration/data/models/my_reports_model.dart';

abstract class GetMyReportsRepo {
  Future<List<ReportDoneModel>> getMyReports();
}
