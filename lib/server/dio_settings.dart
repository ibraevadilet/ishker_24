import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioSettings {
  DioSettings({required this.prefs}) {
    initialSettings();
  }
  final SharedPreferences prefs;

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
          final accessToken = prefs.getString(SharedKeys.accessToken) ?? '';
          if (accessToken != '') {
            options.headers['authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            dio.post(
              'security/auth/access',
              options: AppDioHeader.dioHeader(),
            );
          }
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
