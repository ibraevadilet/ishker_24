import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';

import 'transfer_perform_usecase.dart';

class TransferValidateUseCase
    implements UseCase<Result<TransferValidate, Exception>, TransferParams> {
  TransferValidateUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<TransferValidate, Exception>> call(
    TransferParams params,
  ) async =>
      _repository.validate(params);
}
