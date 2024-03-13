import 'package:equatable/equatable.dart';

abstract class BaseTransferParams extends Equatable {
  const BaseTransferParams({
    required this.login,
    required this.password,
    required this.timestamp,
    required this.summa,
    this.fee = 0,
    required this.currency,
    required this.serviceid,
    required this.typeservice,
    required this.typerequest,
    required this.account,
    required this.accountDt,
  });

  final String login;
  final String password;
  final DateTime timestamp;
  final int summa;
  final int? fee;
  final String currency;
  final String serviceid;
  final String typeservice;
  final String typerequest;
  final String account;
  final String accountDt;

  @override
  List<Object?> get props => [
        login,
        password,
        timestamp,
        summa,
        fee,
        currency,
        serviceid,
        typeservice,
        typerequest,
        account,
        accountDt,
      ];
}
