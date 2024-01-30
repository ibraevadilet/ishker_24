abstract class PinCodeRepo {
  Future<void> setPinCode(String persistentSessionToken, String pin);
  Future<String> enterPinCode(String pinCode);
  Future<String> setNewPinCode(String resetPinCodeToken, String pinCode);
}
