import 'package:ishker_24/features/tunduk_auth/recovery_password/data/models/reset_password_token_model.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_token_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class ResetPasswordTokenUseCase {
  final ResetPasswordTokenRepo repo;
  ResetPasswordTokenUseCase({
    required this.repo,
  });

  late ResetPasswordTokenModel resetPasswordTokenModel;

  Future<void> resetPasswordToken(String otp) async {
    final pin = sl<ResetPasswordUseCase>().pin;
    try {
      final result = await repo.resetPasswordToken(pin, otp);
      resetPasswordTokenModel = result;
    } catch (e) {
      rethrow;
    }
  }
}
