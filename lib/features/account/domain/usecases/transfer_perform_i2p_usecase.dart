import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_body.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/repositories/i_account_repository.dart';

import 'base_transfer_params.dart';

class TransferPerformI2PUseCase
    implements
        UseCase<Result<TransferPerform, Exception>, TransferPerformI2PParams> {
  TransferPerformI2PUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<TransferPerform, Exception>> call(
    TransferPerformI2PParams params,
  ) async =>
      _repository.performI2P(params);
}

final class TransferPerformI2PParams extends BaseTransferParams {
  const TransferPerformI2PParams({
    required super.summa,
    required super.fee,
    required super.currency,
    required super.account,
    required super.accountDt,
    required this.id,
    required this.inn,
  });

  final int id;
  final String inn;

  TransferPerformI2PBody toRequestBody() => TransferPerformI2PBody(
        summa: summa,
        fee: fee,
        currency: currency,
        account: account,
        accountDt: accountDt,
        id: id,
        inn: inn,
      );

  @override
  List<Object?> get props => [id, inn];
}
