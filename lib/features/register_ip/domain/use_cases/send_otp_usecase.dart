import 'package:ishker_24/features/register_ip/domain/repositories/send_otp_repository.dart';

class SendOtpUseCase {
  final SendOtpRepo repo;
  SendOtpUseCase({
    required this.repo,
  });

  Future<void> sendOtp(String authType) async {
    try {
      await repo.sendOtp(authType);
    } catch (e) {
      rethrow;
    }
  }
}
