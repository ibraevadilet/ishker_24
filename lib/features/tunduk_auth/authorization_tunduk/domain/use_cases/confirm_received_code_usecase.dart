import 'package:ishker_24/core/app_helpers/app_device_info.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/get_confirm_code_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_confirm_code_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/confirm_received_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_confirm_code_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class ConfirmReceivedCodeUseCase {
  final ConfirmReceivedCodeRepo repo;
  ConfirmReceivedCodeUseCase({
    required this.repo,
  });
  String persistentSessionToken = '';

  Future<GetConfirmCodeModel> confirmReceivedCode(
      String verificationCode) async {
    final method = sl<GetConfirmCodeUseCase>().method;
    final inn = sl<AuthUseCase>().inn;
    final deviceId = await AppDeviceInfo.deviceId();
    final twoFactorSessionToken =
        sl<GetConfirmCodeUseCase>().twoFactorSessionToken;
    final model = SendConfirmCodeModel(
      deviceId: deviceId,
      inn: inn,
      verificationCode: verificationCode,
      method: method,
      twoFactorSessionToken: twoFactorSessionToken,
    );
    try {
      final result = await repo.confirmReceivedCode(model);
      persistentSessionToken = result.persistentSessionToken;
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
