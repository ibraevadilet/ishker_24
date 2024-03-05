import 'package:dio/dio.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/check_oep_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class CheckOepRepoImpl implements CheckOepRepo {
  final Dio dio;
  CheckOepRepoImpl({required this.dio});

  @override
  Future<void> checkOep() async {
    final pin = AppSavedPin.getPin();
    try {
      await dio.post(
        'oep-service/sign/methods',
        data: {'personIdnp': pin},
      );
    } catch (e) {
      if (e is DioException) {
        throw CatchException(message: e.response?.data['errorMessage']).message;
      }
      throw CatchException.convertException(e).message;
    }
  }
}
