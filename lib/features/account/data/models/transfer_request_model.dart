import 'package:equatable/equatable.dart';

class TransferRequestModel extends Equatable {
  const TransferRequestModel({
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

  Map<String, dynamic> toValidateJson() => {
        "summa": 1000,
        "fee": 0,
        "currency": currency,
        "serviceid": serviceid,
        "typeservice": typeservice,
        "typerequest": 'validate',
        "account": account,
        "account_dt": accountDt,
        "inn": inn,
      };

  Map<String, dynamic> toPerformJson() => {
        "id": id,
        "summa": 1000,
        "fee": 0,
        "currency": currency,
        "serviceid": serviceid,
        "typeservice": typeservice,
        "typerequest": 'pay',
        "account": account,
        "account_dt": accountDt,
        "inn": inn,
      };

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
        inn,
      ];
}
