import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/set_reset_pin_code_repository.dart';

class SendResetPinCodeUseCase {
  final SendResetPinCodeRepo repo;
  SendResetPinCodeUseCase({
    required this.repo,
  });

  Future<String> sendResetPinCode({
    required String password,
    required String method,
  }) async {
    final deviceId = await AppDeviceInfo.deviceId();
    final deviceName = await AppDeviceInfo.deviceName();
    try {
      return await repo.sendResetPinCode(
        password: password,
        method: method,
        deviceId: deviceId,
        deviceName: deviceName,
      );
    } catch (e) {
      rethrow;
    }
  }
}
