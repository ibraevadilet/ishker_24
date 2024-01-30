import 'package:ishker_24/features/tunduk_auth/recovery_password/data/models/reset_password_token_model.dart';

abstract class ResetPasswordTokenRepo {
  Future<ResetPasswordTokenModel> resetPasswordToken(String pin, String otp);
}
