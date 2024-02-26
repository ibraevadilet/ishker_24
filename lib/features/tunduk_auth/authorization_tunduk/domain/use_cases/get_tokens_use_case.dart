// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTokensUseCase {
  GetTokensUseCase({
    required this.repo,
    required this.prefs,
  });
  final PinCodeRepo repo;
  final SharedPreferences prefs;

  String pin = '';

  Future<void> getTokens(String pinFrom) async {
    final deviceId = await AppDeviceInfo.deviceId();
    pin = pinFrom;
    try {
      final result = await repo.getToken(deviceId, pin);
      prefs.setString(SharedKeys.accessToken, result.accessToken);
      prefs.setString(SharedKeys.refreshToken, result.refreshToken);
    } catch (e) {
      rethrow;
    }
  }
}
