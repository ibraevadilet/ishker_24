import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/my_reports_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_my_reports_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetMyReportsRepoImpl implements GetMyReportsRepo {
  final Dio dio;
  GetMyReportsRepoImpl({required this.dio});

  @override
  Future<List<ReportDoneModel>> getMyReports() async {
    // final inn = AppSavedPin.getPin();
    const inn = '22306199300089';
    try {
      final response = await dio.get(
        'declaration/user/declarations',
        queryParameters: {
          'inn': inn,
        },
      );
      return response.data['data']
          .map<ReportDoneModel>((e) => ReportDoneModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
