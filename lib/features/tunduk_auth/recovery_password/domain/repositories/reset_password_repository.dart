abstract class ResetPasswordRepo {
  Future<void> resetPassword({
    required String pin,
    required String contact,
    required String method,
  });
}
