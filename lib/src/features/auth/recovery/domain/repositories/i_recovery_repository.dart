import 'package:ishker_24/src/core/utils/result.dart';

import '../entities/reset_pass_token.dart';
import '../usecases/reset_passtoken_usecase.dart';
import '../usecases/reset_password_usecase.dart';
import '../usecases/set_new_password_usecase.dart';

abstract interface class IRecoveryRepository {
  Future<Result<void, Exception>> resetPassword(ResetPasswordParams params);
  Future<Result<void, Exception>> setNewPassword(SetNewPasswordParams params);
  Future<Result<ResetPasswordToken, Exception>> resetPasswordToken(
    ResetPasswordTokenParams params,
  );
}
