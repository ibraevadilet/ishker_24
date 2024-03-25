import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/rsk/account/domain/repositories/i_account_repository.dart';

import '../../data/models/transfer_validate_body.dart';
import '../entities/transfer_validate.dart';
import 'base_transfer_params.dart';

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
    required super.login,
    required super.password,
    required super.timestamp,
    required super.summa,
    required super.fee,
    required super.currency,
    required super.serviceid,
    required super.typeservice,
    required super.typerequest,
    required super.account,
    required super.accountDt,
  });

  TransferValidateI2IBody toRequestBody() => TransferValidateI2IBody(
        login: login,
        password: password,
        timestamp: timestamp,
        summa: summa,
        fee: fee,
        currency: currency,
        serviceid: serviceid,
        typeservice: typeservice,
        typerequest: typerequest,
        account: account,
        accountDt: accountDt,
      );
}
