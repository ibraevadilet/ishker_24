import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/report_detail_pdf_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class ReportDetailPdfRepoImpl implements ReportDetailPdfRepo {
  final Dio dio;
  ReportDetailPdfRepoImpl({required this.dio});

  @override
  Future<String> reportDetailPdf(String reportId) async {
    try {
      final response = await dio.get(
        'declaration/user/declarations/$reportId',
      );
      return response.data;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
