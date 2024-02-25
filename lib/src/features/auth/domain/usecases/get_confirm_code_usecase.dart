import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_auth_repository.dart';

class GetConfirmCodeUseCase
    implements UseCase<Result<void, Exception>, GetConfirmCodeParams> {
  GetConfirmCodeUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<void, Exception>> call(GetConfirmCodeParams params) async =>
      _repository.getConfirmCode(params);
}

final class GetConfirmCodeParams extends Equatable {
  const GetConfirmCodeParams(this.method, this.token);

  final String method;
  final String token;

  @override
  List<Object?> get props => [method, token];
}
