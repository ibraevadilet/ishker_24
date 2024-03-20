import 'package:equatable/equatable.dart';

class ClientInfo extends Equatable {
  const ClientInfo({
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
  final List<AccountChet> accountsList;

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

class AccountChet extends Equatable {
  const AccountChet({
    required this.accountNumber,
    required this.currency,
    required this.balance,
  });

  final String accountNumber;
  final String currency;
  final num balance;

  @override
  String toString() =>
      'AccountChetModel(accountNumber: $accountNumber, currency: $currency, balance: $balance)';

  @override
  List<Object?> get props => [accountNumber, currency, balance];
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
