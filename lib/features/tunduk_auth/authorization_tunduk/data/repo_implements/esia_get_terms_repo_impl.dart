import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/encode_base_64.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/esia_get_terms_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:path_provider/path_provider.dart';

class EsiaGetTermsRepoImpl implements EsiaGetTermsRepo {
  final Dio dio;
  EsiaGetTermsRepoImpl({required this.dio});

  @override
  Future<String> esiaGetTerms() async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/EsiaTerms.pdf');

      await dio.download(
        AppTextConstants.esiUserStatement,
        file.path,
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': AppEncode.encode64Basic(),
          },
        ),
      );

      return file.path;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
