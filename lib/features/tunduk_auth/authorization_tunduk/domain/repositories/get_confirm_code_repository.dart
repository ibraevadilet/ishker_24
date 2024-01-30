abstract class GetConfirmCodeRepo {
  Future<void> getConfirmCode({
    required String method,
    required String twoFactorSessionToken,
  });
}
