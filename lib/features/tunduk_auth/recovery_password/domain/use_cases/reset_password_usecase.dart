import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_repository.dart';

class ResetPasswordUseCase {
  final ResetPasswordRepo repo;
  ResetPasswordUseCase({
    required this.repo,
  });

  String pin = '';
  Future<void> resetPassword({
    required String pin,
    required String contact,
    required String method,
  }) async {
    this.pin = pin;
    try {
      await repo.resetPassword(
        pin: pin,
        contact: contact,
        method: method,
      );
    } catch (e) {
      rethrow;
    }
  }
}
