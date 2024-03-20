import 'package:equatable/equatable.dart';
import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/data/models/transfer_request_model.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/rsk/account/domain/repositories/i_account_repository.dart';

class TransferPerformUseCase
    implements UseCase<Result<TransferPerform, Exception>, TransferParams> {
  TransferPerformUseCase(this._repository);

  final IAccountRepository _repository;

  @override
  Future<Result<TransferPerform, Exception>> call(
    TransferParams params,
  ) async =>
      _repository.perform(params);
}

final class TransferParams extends Equatable {
  const TransferParams({
    this.id,
    required this.summa,
    this.fee,
    required this.currency,
    required this.serviceid,
    this.typeservice = 'popolnenie_card_pan',
    this.typerequest,
    required this.account,
    required this.accountDt,
    required this.inn,
  });

  final int? id;
  final int summa;
  final int? fee;
  final String currency;
  final String serviceid;
  final String typeservice;
  final String? typerequest;
  final String account;
  final String accountDt;
  final String inn;

  TransferParams copyWith({
    int? id,
    int? summa,
    int? fee,
    String? currency,
    String? serviceid,
    String? typeservice,
    String? typerequest,
    String? account,
    String? accountDt,
    String? inn,
  }) =>
      TransferParams(
        id: id ?? this.id,
        summa: summa ?? this.summa,
        fee: fee ?? this.fee,
        currency: currency ?? this.currency,
        serviceid: serviceid ?? this.serviceid,
        typeservice: typeservice ?? this.typeservice,
        typerequest: typerequest ?? this.typerequest,
        account: account ?? this.account,
        accountDt: accountDt ?? this.accountDt,
        inn: inn ?? this.inn,
      );

  TransferRequestModel toModel() => TransferRequestModel(
        id: id,
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
  List<Object?> get props => [
        id,
        summa,
        fee,
        currency,
        serviceid,
        typeservice,
        typerequest,
        account,
        accountDt,
        inn
      ];
}
