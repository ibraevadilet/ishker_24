import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishker_24/features/register_ip/data/models/get_gns_pdf_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_gns_pdf_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:path_provider/path_provider.dart';

class GetGnsPdfRepoImpl implements GetGnsPdfRepo {
  final Dio dio;
  GetGnsPdfRepoImpl({required this.dio});

  @override
  Future<String> getGnsPdf(GetGnsPdfModel model) async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/GNS.pdf');

      await dio.download(
        'gns/get-pdf',
        file.path,
        options: Options(
          method: 'POST',
        ),
        data: model.toJson(),
      );

      return file.path;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
