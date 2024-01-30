import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/reset_pin_code_token_repository.dart';

class ResetPinCodeTokenUseCase {
  final ResetPinCodeTokenRepo repo;
  ResetPinCodeTokenUseCase({
    required this.repo,
  });

  String resetPinCodeToken = '';

  Future<void> resetPinCode(String verificationCode) async {
    try {
      final result = await repo.resetPinCodeToken(verificationCode);
      resetPinCodeToken = result;
    } catch (e) {
      rethrow;
    }
  }
}
