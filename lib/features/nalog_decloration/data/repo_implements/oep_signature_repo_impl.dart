import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/check_oep_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/oep_signature_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class OepSignatureRepoImpl implements OepSignatureRepo {
  final Dio dio;
  OepSignatureRepoImpl({required this.dio});

  @override
  Future<CheckOepModel> checkOep() async {
    // final pin = AppSavedPin.getPin();
    const pin = '22306199300089';
    try {
      final response = await dio.get(
        'declaration/sign/check-oep',
        queryParameters: {
          'inn': pin,
        },
      );
      return CheckOepModel.fromJson(response.data['data']);
    } catch (e) {
      if (e is DioException) {
        throw CatchException(
          message: e.response!.data?['message'] ?? 'Приозошла системная ошибка',
        ).message;
      } else {
        throw CatchException.convertException(e).message;
      }
    }
  }

  @override
  Future<CheckOepModel> sendOtp(String authType) async {
    // final pin = AppSavedPin.getPin();
    const pin = '22306199300089';
    try {
      final response = await dio.get(
        'declaration/sign/send-otp',
        queryParameters: {
          'inn': pin,
          'authType': authType,
        },
      );
      return CheckOepModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw CatchException(
          message: e.response!.data?['message'] ?? 'Приозошла системная ошибка',
        ).message;
      } else {
        throw CatchException.convertException(e).message;
      }
    }
  }
}
