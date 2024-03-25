import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/rsk/account/domain/entities/account.dart';

import '../repositories/i_account_repository.dart';

class AccountInfoUseCase
    implements UseCase<Result<Account, Exception>, String> {
  AccountInfoUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<Account, Exception>> call(String account) async =>
      _repository.info(account);
}
