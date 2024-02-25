import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/constants/constants.dart';
import 'package:ishker_24/src/core/storage/user_local_data_source.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';

class DioClient {
  DioClient(this._local) {
    init();
  }

  final ILocalDataSource _local;

  static final _optiions = BaseOptions(
    baseUrl: AppTextConstants.mainServer,
    responseType: ResponseType.json,
    contentType: "application/json; charset=utf-8",
    connectTimeout: const Duration(milliseconds: 50000),
    receiveTimeout: const Duration(milliseconds: 50000),
  );

  Dio dioForNewTokens = Dio(_optiions);
  Dio dio = Dio(_optiions);

  void init() {
    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _local.accessToken ?? '';
          if (accessToken != '') {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            Response response;
            dev.log('STATUSSSS 401');
            await _newAccessToken();
            final newToken = await _local.refreshToken;
            dev.log('NEWWWW TOKEN -- $newToken');
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
    ]);
  }

  //TODO: ref
  Future<void> _newAccessToken() async {
    dev.log('GET NEW TOKENNNN');
    final refreshToken = _local.refreshToken;
    try {
      final result = await dioForNewTokens.post(
        'security/auth/access',
        options: AppDioHeader.dioHeader(),
        data: {'refreshToken': refreshToken},
      );

      final token = result.data['accessToken'];
      dev.log(' NEW ${result.data['accessToken']}');
      await _local.cacheAccessToken(token);
    } catch (e, s) {
      dev.log("DioSettings._newAccessToken(): catch", error: e, stackTrace: s);

      if (e is DioException && e.response!.statusCode == 401) {
        await _newRefreshToken();
        dio.fetch(e.requestOptions);
      }
    }
  }

  Future<void> _newRefreshToken() async {
    final refreshToken = await _local.refreshToken;
    try {
      final result = await dio.post(
        'security/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      await Future.wait([
        _local.cacheAccessToken(result.data['accessToken']),
        _local.cacheRefreshToken(result.data['refreshToken']),
      ]);
    } catch (e, s) {
      dev.log("DioSettings._newRefreshToken(): catch", error: e, stackTrace: s);
      await Future.wait([
        _local.removeAccessToken(),
        _local.removeRefreshToken(),
      ]);
    }
  }
}
