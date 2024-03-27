import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_body.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';
import 'package:ishker_24/features/account/domain/usecases/base_transfer_params.dart';

class TransferValidateI2IUseCase
    implements
        UseCase<Result<TransferValidate, Exception>,
            TransferValidateI2IParams> {
  TransferValidateI2IUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<TransferValidate, Exception>> call(
    TransferValidateI2IParams params,
  ) async =>
      _repository.validateI2I(params);
}

class TransferValidateI2IParams extends BaseTransferParams {
  const TransferValidateI2IParams({
    required super.summa,
    required super.fee,
    required super.currency,
    required super.account,
    required super.accountDt,
  });

  TransferValidateI2IBody toRequestBody() => TransferValidateI2IBody(
        summa: summa,
        fee: fee,
        currency: currency,
        account: account,
        accountDt: accountDt,
      );
}
