import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_body.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';
import 'package:ishker_24/features/account/domain/usecases/base_transfer_params.dart';

class TransferValidateI2PUseCase
    implements
        UseCase<Result<TransferValidate, Exception>,
            TransferValidateI2PParams> {
  TransferValidateI2PUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<TransferValidate, Exception>> call(
    TransferValidateI2PParams params,
  ) async =>
      _repository.validateI2P(params);
}

class TransferValidateI2PParams extends BaseTransferParams {
  const TransferValidateI2PParams({
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
    required this.inn,
  });

  final String inn;

  TransferValidateI2PBody toRequestBody() => TransferValidateI2PBody(
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
        inn: inn,
      );

  @override
  List<Object?> get props => [inn];
}
