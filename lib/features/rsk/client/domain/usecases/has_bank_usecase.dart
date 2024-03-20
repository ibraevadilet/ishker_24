import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/client/domain/repositories/i_rsk_reposiitory.dart';

class HasBankUseCase implements UseCase<Result<bool, Exception>, String> {
  HasBankUseCase(this._repository);

  final IRskRepository _repository;

  @override
  Future<Result<bool, Exception>> call(pin) async => _repository.hasBank(pin);
}
