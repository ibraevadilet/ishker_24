import 'dart:developer';

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

  Dio dioForNewTokens = Dio(
    BaseOptions(
      baseUrl: AppTextConstants.mainServer,
      responseType: ResponseType.json,
      contentType: "application/json; charset=utf-8",
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    ),
  );

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
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            await _newAccessToken();
            dio.fetch(e.requestOptions);
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

  Future<void> _newAccessToken() async {
    final refreshToken = prefs.getString(SharedKeys.refreshToken);
    try {
      final result = await dioForNewTokens.post(
        'security/auth/access',
        options: AppDioHeader.dioHeader(),
        data: {
          'refreshToken': refreshToken,
        },
      );
      prefs.setString(SharedKeys.accessToken, result.data['accessToken']);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          await _newRefreshToken();
          dio.fetch(e.requestOptions);
        }
      }
    }
  }

  Future<void> _newRefreshToken() async {
    final refreshToken = prefs.getString(SharedKeys.refreshToken);
    try {
      final result = await dio.post(
        'security/auth/refresh',
        data: {
          'refreshToken': refreshToken,
        },
      );
      prefs.setString(SharedKeys.accessToken, result.data['accessToken']);
      prefs.setString(SharedKeys.refreshToken, result.data['refreshToken']);
    } catch (e) {
      log(e.toString());
    }
  }
}
