import 'package:dio/dio.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';

class DioKKM {
  DioKKM() {
    initialSettings();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppTextConstants.megaKassaServer,
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
