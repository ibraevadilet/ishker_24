import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_auth_repository.dart';

class GrnpCheckUseCase implements UseCase<Result<bool, Exception>, String> {
  GrnpCheckUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<bool, Exception>> call(String pin) async =>
      _repository.checkGRNP(pin);
}
