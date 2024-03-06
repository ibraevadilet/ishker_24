import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/encode_base_64.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';

class DioBaseAuth {
  DioBaseAuth() {
    initialSettings();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppTextConstants.mainServer,
      responseType: ResponseType.json,
      contentType: "application/json; charset=utf-8",
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    ),
  );

  void initialSettings() {
    final interceptors = dio.interceptors;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({
            'Authorization': AppEncode.encode64Basic(
              userName: 'user',
              passWord: 'user',
            ),
          });
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          return handler.next(e);
        },
      ),
    );
    interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
