import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_for_auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepo repo;
  AuthUseCase({
    required this.repo,
  });
  String inn = '';
  Future<AuthModel> auth(String login, String password) async {
    inn = login;
    try {
      final deviceId = await AppDeviceInfo.deviceId();
      final deviceName = await AppDeviceInfo.deviceName();

      return await repo.auth(
        SendForAuthModel(
          username: login,
          password: password,
          deviceId: deviceId,
          deviceName: deviceName,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
