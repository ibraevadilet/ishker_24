abstract class SetNewPasswordRepo {
  Future<void> setNewPassword({
    required String userId,
    required String token,
    required String password,
  });
}
