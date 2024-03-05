import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/generate_pdf_review_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:path_provider/path_provider.dart';

class GeneratePdfReviewRepoImpl implements GeneratePdfReviewRepo {
  final Dio dio;
  GeneratePdfReviewRepoImpl({required this.dio});

  @override
  Future<String> generatePdfReview(
      Map<String, dynamic> sendModel, String type) async {
    try {
      // final response = await dio.get(
      //   'declaration/pdf/declaration/generate',
      //   queryParameters: {
      //     'type': type,
      //   },
      //   data: sendModel,
      // );

      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/reviewpdf.pdf');

      final response = await dio.post(
        'declaration/pdf/declaration/generate',
        queryParameters: {
          'type': type,
        },
        data: sendModel,
        options: Options(
          method: 'POST',
          responseType: ResponseType.bytes,
        ),
      );

      await file.writeAsBytes(response.data, flush: true);
      return file.path;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
