import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/repositories/i_recovery_repository.dart';

class ResetPasswordTokenUseCase
    implements UseCase<Result<void, Exception>, ResetPasswordTokenParams> {
  ResetPasswordTokenUseCase(this._repository);

  final IRecoveryRepository _repository;

  @override
  Future<Result<void, Exception>> call(ResetPasswordTokenParams params) async =>
      _repository.resetPasswordToken(params);
}

class ResetPasswordTokenParams extends Equatable {
  const ResetPasswordTokenParams(this.pin, this.otp);

  final String pin;
  final String otp;

  @override
  List<Object?> get props => [pin, otp];
}
