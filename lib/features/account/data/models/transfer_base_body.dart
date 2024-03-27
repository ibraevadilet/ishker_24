import 'package:equatable/equatable.dart';

abstract class BaseTransferRequestBody extends Equatable {
  const BaseTransferRequestBody({
    required this.summa,
    this.fee = 0,
    required this.currency,
    required this.account,
    required this.accountDt,
  });

  final int summa;
  final int? fee;
  final String currency;
  final String account;
  final String accountDt;

  Map<String, dynamic> toJson();

  @override
  List<Object?> get props => [
        summa,
        fee,
        currency,
        account,
        accountDt,
      ];
}
