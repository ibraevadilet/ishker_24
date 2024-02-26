import 'package:ishker_24/src/core/network/esia_service.dart';
import 'package:ishker_24/src/features/recovery/data/models/reset_pass_token_model.dart';

abstract interface class IRecoveryDataSource {
  Future<void> resetPassword(String pin, String contact, String method);
  Future<void> setNewPassword(
    String userId,
    String token,
    String password,
  );
  Future<ResetPasswordTokenModel> resetPasswordToken(
    String pin,
    String otp,
  );
}

final class RecoveryDataSourceImpl implements IRecoveryDataSource {
  RecoveryDataSourceImpl(this._service);

  final EsiaService _service;

  @override
  Future<void> resetPassword(String pin, String contact, String method) async =>
      _service.resetPassword(pin, contact, method);

  @override
  Future<ResetPasswordTokenModel> resetPasswordToken(
    String pin,
    String otp,
  ) async =>
      _service.resetPasswordToken(pin, otp);

  @override
  Future<void> setNewPassword(
    String userId,
    String token,
    String password,
  ) async =>
      _service.setNewPassword(userId, token, password);
}
