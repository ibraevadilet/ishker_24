import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_auth_repository.dart';

class PinCodeNewUseCase
    implements UseCase<Result<void, Exception>, PinCodeNewParams> {
  PinCodeNewUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<void, Exception>> call(PinCodeNewParams params) async =>
      _repository.pinCodeNew(params);
}

final class PinCodeNewParams extends Equatable {
  const PinCodeNewParams({
    required this.deviceId,
    required this.resetPinCodeToken,
    required this.pinCode,
  });

  final String deviceId;
  final String resetPinCodeToken;
  final String pinCode;

  @override
  List<Object?> get props => [deviceId, resetPinCodeToken, pinCode];
}
