import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/get_confirm_code_repository.dart';

class GetConfirmCodeUseCase {
  final GetConfirmCodeRepo repo;
  GetConfirmCodeUseCase({
    required this.repo,
  });

  String method = '';
  String twoFactorSessionToken = '';

  Future<void> getConfirmCode({
    required String method,
    required String twoFactorSessionToken,
  }) async {
    this.method = method;
    this.twoFactorSessionToken = twoFactorSessionToken;
    try {
      await repo.getConfirmCode(
        method: method,
        twoFactorSessionToken: twoFactorSessionToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}
