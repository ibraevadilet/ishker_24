import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/rsk/client/domain/entities/client_info.dart';

class ClientInfoModel extends Equatable {
  const ClientInfoModel({
    required this.absId,
    required this.idDocSeries,
    required this.idDocNumber,
    required this.email,
    required this.mobilePhone,
    required this.pin,
    required this.regDocSeries,
    required this.regDocNumber,
    required this.regDocDate,
    required this.fio,
    required this.accountsList,
  });

  final String absId;
  final String idDocSeries;
  final String idDocNumber;
  final String email;
  final String mobilePhone;
  final String pin;
  final String regDocSeries;
  final String regDocNumber;
  final String regDocDate;
  final String fio;
  final List<AccountChetModel> accountsList;

  factory ClientInfoModel.fromJson(Map<String, dynamic> json) =>
      ClientInfoModel(
        absId: json["absId"] ?? '',
        idDocSeries: json["idDocSeries"] ?? '',
        idDocNumber: json["idDocNumber"] ?? '',
        email: json["email"] ?? '',
        mobilePhone: json["mobilePhone"] ?? '',
        pin: json["pin"] ?? '',
        regDocSeries: json["regDocSeries"] ?? '',
        regDocNumber: json["regDocNumber"] ?? '',
        regDocDate: json["regDocDate"] ?? '',
        fio: json["fio"] ?? '',
        accountsList: json["accounts"]
            .map<AccountChetModel>((e) => AccountChetModel.fromJson(e))
            .toList(),
      );

  ClientInfo get toEntity => ClientInfo(
        absId: absId,
        idDocSeries: idDocSeries,
        idDocNumber: idDocNumber,
        email: email,
        mobilePhone: mobilePhone,
        pin: pin,
        regDocSeries: regDocSeries,
        regDocNumber: regDocNumber,
        regDocDate: regDocDate,
        fio: fio,
        accountsList: accountsList.map((e) => e.toEntity).toList(),
      );

  @override
  List<Object?> get props => [
        absId,
        idDocSeries,
        idDocNumber,
        email,
        mobilePhone,
        pin,
        regDocSeries,
        regDocNumber,
        regDocDate,
        fio,
        accountsList,
      ];
}

class AccountChetModel extends Equatable {
  const AccountChetModel({
    required this.accountNumber,
    required this.currency,
    required this.balance,
  });

  final String accountNumber;
  final String currency;
  final num balance;

  factory AccountChetModel.fromJson(Map<String, dynamic> map) {
    return AccountChetModel(
      accountNumber: map['accountNumber'],
      currency: currancyToString(map['currency']),
      balance: map['balance'],
    );
  }

  AccountChet get toEntity => AccountChet(
        accountNumber: accountNumber,
        currency: currency,
        balance: balance,
      );

  @override
  List<Object?> get props => [accountNumber, currency, balance];

  @override
  String toString() =>
      'AccountChetModel(accountNumber: $accountNumber, currency: $currency, balance: $balance)';
}

String currancyToString(String currancy) {
  switch (currancy) {
    case '417':
      return 'KGZ';
    case '418':
      return 'Dollar';
    default:
      return 'Неизвестно';
  }
}
