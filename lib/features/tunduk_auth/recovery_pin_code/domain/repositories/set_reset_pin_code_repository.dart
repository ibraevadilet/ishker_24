abstract class SendResetPinCodeRepo {
  Future<String> sendResetPinCode({
    required String password,
    required String method,
    required String deviceId,
    required String deviceName,
  });
}
