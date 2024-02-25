import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../../data/models/ishker_auth_model.dart';
import '../repositories/i_auth_repository.dart';

class PinCodeEnterUseCase
    implements UseCase<Result<IshkerAuthModel, Exception>, PinCodeEnterParams> {
  PinCodeEnterUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<IshkerAuthModel, Exception>> call(
          PinCodeEnterParams params) async =>
      _repository.pinCodeEnter(params);
}

final class PinCodeEnterParams extends Equatable {
  const PinCodeEnterParams({
    required this.deviceId,
    required this.pin,
    required this.pinCode,
  });

  final String deviceId;
  final String pin;
  final String pinCode;

  @override
  List<Object?> get props => [deviceId, pin, pinCode];
}
