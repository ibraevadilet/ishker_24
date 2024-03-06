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

// final class TransferValidateParams extends Equatable {
//   const TransferValidateParams({
//     required this.summa,
//     this.fee,
//     required this.currency,
//     required this.serviceid,
//     this.typerequest = 'validate',
//     required this.account,
//     required this.accountDt,
//     required this.inn,
//   });

//   final int summa;
//   final int? fee;
//   final String currency;
//   final String serviceid;
//   final String typerequest;
//   final String account;
//   final String accountDt;
//   final String inn;

//   @override
//   List<Object?> get props =>
//       [summa, fee, currency, serviceid, typerequest, account, accountDt, inn];
// }
