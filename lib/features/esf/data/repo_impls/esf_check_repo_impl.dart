import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_check_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class EsfCheckRepoImpl implements EsfCheckRepo {
  EsfCheckRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<bool> esfCheck() async {
    final pin = AppSavedPin.getPin();

    try {
      final response = await dio.get(
        'esf/gns/api/v1/check',
        queryParameters: {
          'tin': pin,
        },
      );
      return response.data;
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }
}
