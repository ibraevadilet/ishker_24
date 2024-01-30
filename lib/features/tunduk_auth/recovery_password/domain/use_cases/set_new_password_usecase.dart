import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/set_new_password_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_token_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class SetNewPasswordUseCase {
  final SetNewPasswordRepo repo;
  SetNewPasswordUseCase({
    required this.repo,
  });

  Future<void> setNewPassword(String password) async {
    final resetPasswordTokenModel =
        sl<ResetPasswordTokenUseCase>().resetPasswordTokenModel;
    try {
      await repo.setNewPassword(
        userId: resetPasswordTokenModel.userId,
        token: resetPasswordTokenModel.token,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
}
