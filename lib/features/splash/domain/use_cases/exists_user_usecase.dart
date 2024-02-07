import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/splash/domain/repositories/exists_user_repository.dart';

class ExistsUserUseCase {
  final ExistsUserRepo repo;
  ExistsUserUseCase({
    required this.repo,
  });

  String pin = '';

  Future<String> existsUser() async {
    final deviceId = await AppDeviceInfo.deviceId();
    try {
      pin = await repo.existsUser(deviceId);
      return pin;
    } catch (e) {
      rethrow;
    }
  }

  // Future<IshkerAuthModel> getToken(String pin) async {
  //   final deviceId = await AppDeviceInfo.deviceId();
  //   try {
  //     return await repo.getToken(deviceId, pin);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
