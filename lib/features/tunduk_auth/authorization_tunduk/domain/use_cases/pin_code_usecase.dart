import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/confirm_received_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/use_cases/reset_pin_code_token_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCodeUseCase {
  final PinCodeRepo repo;
  final SharedPreferences prefs;
  PinCodeUseCase({
    required this.repo,
    required this.prefs,
  });

  Future<void> setPinCode(String pin) async {
    try {
      final persistentSessionToken =
          sl<ConfirmReceivedCodeUseCase>().persistentSessionToken;
      final result = await repo.setPinCode(persistentSessionToken, pin);
      prefs.setString(SharedKeys.accessToken, result.accessToken);
      prefs.setString(SharedKeys.refreshToken, result.refreshToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> enterPinCode(String pin) async {
    try {
      final result = await repo.enterPinCode(pin);
      prefs.setString(SharedKeys.accessToken, result.accessToken);
      prefs.setString(SharedKeys.refreshToken, result.refreshToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setNewPinCode(String pin) async {
    final resetPinCodeToken = sl<ResetPinCodeTokenUseCase>().resetPinCodeToken;
    try {
      final result = await repo.setNewPinCode(resetPinCodeToken, pin);
      prefs.setString(SharedKeys.accessToken, result.accessToken);
      prefs.setString(SharedKeys.refreshToken, result.refreshToken);
    } catch (e) {
      rethrow;
    }
  }
}
