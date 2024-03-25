import 'package:dio/dio.dart';
import 'package:ishker_24/src/core/constants/constants.dart';
import 'package:ishker_24/src/core/storage/user_local_data_source.dart';
import 'package:ishker_24/src/core/utils/dio_header.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
          //////ADD version build
          final packageInfo = await PackageInfo.fromPlatform();
          final buildNumber = packageInfo.buildNumber;
          options.headers['versionBuild'] = buildNumber;

          //////ADD TOKEN
          final accessToken = await _local.accessToken;
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          //////ADD TEST AUTH FOR STORE TESTERS
          final pin = await _local.pin;
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
            final newToken = await _local.refreshToken;
            if (newToken != null) {
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
            }
          } else {
            return handler.next(e);
          }
        },
      ),
    ]);
  }

  //TODO: ref
  Future<void> _newAccessToken() async {
    final refreshToken = await _local.refreshToken;
    try {
      final result = await dioForNewTokens.post(
        'security/auth/access',
        options: AppDioHeader.dioHeader(),
        data: {'refreshToken': refreshToken},
      );
      await _local.cacheAccessToken(result.data['accessToken']);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          await _newRefreshToken();
          dio.fetch(e.requestOptions);
        } else if (e.response!.statusCode == 446) {
          AppSnackBar.showSnackBar('Невалидный JWT токен!');
          await _local.clear();
          // AppRouting.pushAndPopUntilFunction(const AuthRoute());
        }
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
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 446) {
          AppSnackBar.showSnackBar('Невалидный JWT токен!');
          await Future.wait([
            _local.removeAccessToken(),
            _local.removeRefreshToken(),
          ]);
        }
      }
    }
  }
}
