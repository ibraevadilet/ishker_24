import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/register_ip/data/models/get_gns_pdf_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_gns_pdf_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetGnsPdfRepoImpl implements GetGnsPdfRepo {
  final Dio dio;
  final SharedPreferences pref;
  GetGnsPdfRepoImpl({required this.dio, required this.pref});

  @override
  Future<String> getGnsPdf(GetGnsPdfModel model) async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/GNS.pdf');
      final token = pref.getString(SharedKeys.accessToken)!;

      await dio.download(
        'gns/get-pdf',
        file.path,
        options: Options(
          method: 'POST',
          headers: {'authorization': 'Bearer $token'},
        ),
        data: model.toJson(),
      );

      return file.path;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
