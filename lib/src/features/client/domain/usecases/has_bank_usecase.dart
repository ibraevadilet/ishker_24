import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_client_reposiitory.dart';

class HasBankUseCase implements UseCase<Result<bool, Exception>, String> {
  HasBankUseCase(this._repository);

  final IClientRepository _repository;

  @override
  Future<Result<bool, Exception>> call(pin) async => _repository.hasBank(pin);
}
