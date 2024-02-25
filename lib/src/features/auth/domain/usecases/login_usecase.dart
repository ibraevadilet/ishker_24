import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../entity/auth_entity.dart';
import '../repositories/i_auth_repository.dart';

class LoginUseCase
    implements UseCase<Result<AuthEntity, Exception>, LoginParams> {
  LoginUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<AuthEntity, Exception>> call(LoginParams params) async =>
      _repository.auth(params);
}

final class LoginParams extends Equatable {
  const LoginParams({
    required this.login,
    required this.password,
    required this.deviceId,
    required this.deviceName,
  });

  final String login;
  final String password;
  final String deviceId;
  final String deviceName;

  @override
  List<Object?> get props => [login, password, deviceId, deviceName];
}
