import 'package:ishker_24/features/splash/data/models/ishker_auth_model.dart';

abstract class PinCodeRepo {
  Future<IshkerAuthModel> setPinCode(String persistentSessionToken, String pin);
  Future<IshkerAuthModel> enterPinCode(String pinCode);
  Future<IshkerAuthModel> setNewPinCode(String resetPinCodeToken, String pinCode);
}
