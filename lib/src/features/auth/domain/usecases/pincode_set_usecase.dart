import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_auth_repository.dart';

class PinCodeSetUseCase
    implements UseCase<Result<void, Exception>, PinCodeSetParams> {
  PinCodeSetUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<void, Exception>> call(PinCodeSetParams params) async =>
      _repository.pinCodeSet(params);
}

final class PinCodeSetParams extends Equatable {
  const PinCodeSetParams({
    required this.persistentSessionToken,
    required this.code,
  });

  final String persistentSessionToken;
  final String code;

  @override
  List<Object?> get props => [
        persistentSessionToken,
        code,
      ];
}
