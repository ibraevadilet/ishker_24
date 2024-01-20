import 'package:dio/dio.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/send_otp_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class SendOtpRepoImpl implements SendOtpRepo {
  final Dio dio;
  SendOtpRepoImpl({required this.dio});

  @override
  Future<void> sendOtp(String authType) async {
    try {
      await dio.get(
        'gns/send-otp',
        queryParameters: {
          'authType': authType,
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}