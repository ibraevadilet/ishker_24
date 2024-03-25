import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/repositories/i_recovery_repository.dart';

class ResetPasswordUseCase
    implements UseCase<Result<void, Exception>, ResetPasswordParams> {
  ResetPasswordUseCase(this._repository);

  final IRecoveryRepository _repository;

  @override
  Future<Result<void, Exception>> call(ResetPasswordParams params) async =>
      _repository.resetPassword(params);
}

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams(this.pin, this.contact, this.method);

  final String pin;
  final String contact;
  final String method;

  @override
  List<Object?> get props => [pin, contact, method];
}
