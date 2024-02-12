import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/check_grnp_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';
import 'package:dio/dio.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckGrnpRepoImpl implements CheckGrnpRepo {
  final Dio dio;
  CheckGrnpRepoImpl({required this.dio});
  

  @override
  Future<bool> checkGrnp() async {
    final pin = sl<SharedPreferences>().getString(SharedKeys.pin)!;
    try {
      final response = await dio.get(
       'grnp/check-existing-db',
        queryParameters: {
          'inn': pin,
        },
      );
      return  response.data;
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
