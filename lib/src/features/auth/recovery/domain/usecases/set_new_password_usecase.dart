import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/repositories/i_recovery_repository.dart';

class SetNewPasswordUseCase
    implements UseCase<Result<void, Exception>, SetNewPasswordParams> {
  SetNewPasswordUseCase(this._repository);

  final IRecoveryRepository _repository;

  @override
  Future<Result<void, Exception>> call(SetNewPasswordParams params) async =>
      _repository.setNewPassword(params);
}

class SetNewPasswordParams extends Equatable {
  const SetNewPasswordParams(this.userId, this.token, this.password);

  final String userId;
  final String token;
  final String password;

  @override
  List<Object?> get props => [userId, token, password];
}
