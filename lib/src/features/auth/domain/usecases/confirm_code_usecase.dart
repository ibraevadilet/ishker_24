import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';

import '../repositories/i_auth_repository.dart';

class ConfirmCodeUseCase
    implements
        UseCase<Result<ConfirmCodeEntity, Exception>, ConfirmCodeParams> {
  ConfirmCodeUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<ConfirmCodeEntity, Exception>> call(
    ConfirmCodeParams params,
  ) async =>
      _repository.confirmRecievedCode(params);
}

final class ConfirmCodeParams extends Equatable {
  const ConfirmCodeParams({
    required this.method,
    required this.pin,
    required this.deviceId,
    required this.twoFactorSessionToken,
    required this.verificationCode,
  });

  final String method;
  final String pin;
  final String deviceId;
  final String twoFactorSessionToken;
  final String verificationCode;

  @override
  List<Object?> get props => [
        method,
        pin,
        deviceId,
        twoFactorSessionToken,
        verificationCode,
      ];
}
