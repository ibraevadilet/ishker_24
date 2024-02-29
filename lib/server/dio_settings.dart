import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_tokens_use_case.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
          //////ADD version build
          final packageInfo = await PackageInfo.fromPlatform();
          final buildNumber = packageInfo.buildNumber;
          options.headers['versionBuild'] = buildNumber;

          //////ADD TOKEN
          final accessToken = prefs.getString(SharedKeys.accessToken) ?? '';
          if (accessToken != '') {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          //////ADD TEST AUTH FOR STORE TESTERS
          final pin = sl<GetTokensUseCase>().pin;
          if (pin == '12345678987654') {
            options.headers['isMock'] = true;
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            Response response;
            await _newAccessToken();
            final newToken = prefs.getString(SharedKeys.refreshToken);
            e.requestOptions.headers
                .update('Authorization', (value) => 'Bearer $newToken');
            var path = '${e.requestOptions.baseUrl}${e.requestOptions.path}';
            if (e.requestOptions.path.contains(e.requestOptions.baseUrl)) {
              path = e.requestOptions.path;
            }
            response = await dio.request(
              path,
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters,
              options: Options(
                contentType: e.requestOptions.contentType,
                extra: e.requestOptions.extra,
                headers: e.requestOptions.headers,
                method: e.requestOptions.method,
                responseType: e.requestOptions.responseType,
              ),
            );

            handler.resolve(response);
          } else {
            return handler.next(e);
          }
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
