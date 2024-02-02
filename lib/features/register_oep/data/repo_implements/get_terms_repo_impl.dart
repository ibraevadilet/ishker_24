import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/encode_base_64.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/get_terms_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:path_provider/path_provider.dart';

class GetTermsRepoImpl implements GetTermsRepo {
  final Dio dio;
  GetTermsRepoImpl({required this.dio});

  @override
  Future<String> getTerms() async {
    const String locale = 'ru';
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/ISHKER.pdf');

      await dio.download(
        '${AppTextConstants.userStatement}$locale',
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
