import 'package:equatable/equatable.dart';

class Account extends Equatable {
  const Account({
    required this.account,
    required this.currency,
    required this.bic,
    required this.depname,
    required this.address,
    required this.pin,
    required this.amount,
    required this.amountFree,
    required this.amountUnfree,
  });

  final String account;
  final String currency;
  final String bic;
  final String depname;
  final String address;
  final String pin;
  final num amount;
  final num amountFree;
  final num amountUnfree;

  @override
  List<Object?> get props => [
        account,
        currency,
        bic,
        depname,
        address,
        pin,
        amount,
        amountFree,
        amountUnfree,
      ];
}
