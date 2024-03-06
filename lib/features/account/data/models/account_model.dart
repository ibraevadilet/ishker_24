import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';

class AccountModel extends Equatable {
  const AccountModel({
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

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        account: json['account'],
        currency: json['currency'],
        bic: json['bic'],
        depname: json['depname'],
        address: json['address'],
        pin: json['pin'],
        amount: json['amount'],
        amountFree: json['free_amount'],
        amountUnfree: json['unfree_amount'],
      );

  Account toEntity() => Account(
        account: account,
        currency: currency,
        bic: bic,
        depname: depname,
        address: address,
        pin: pin,
        amount: amount,
        amountFree: amountFree,
        amountUnfree: amountUnfree,
      );

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
