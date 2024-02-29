// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientInfoModel {
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

  ClientInfoModel({
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
              .toList());
}

class AccountChetModel {
  final String accountNumber;
  final String currency;
  final num balance;
  AccountChetModel({
    required this.accountNumber,
    required this.currency,
    required this.balance,
  });

  @override
  String toString() =>
      'AccountChetModel(accountNumber: $accountNumber, currency: $currency, balance: $balance)';

  factory AccountChetModel.fromJson(Map<String, dynamic> map) {
    return AccountChetModel(
      accountNumber: map['accountNumber'],
      currency: currancyToString(map['currency']),
      balance: map['balance'],
    );
  }

  @override
  bool operator ==(covariant AccountChetModel other) {
    if (identical(this, other)) return true;

    return other.accountNumber == accountNumber &&
        other.currency == currency &&
        other.balance == balance;
  }

  @override
  int get hashCode =>
      accountNumber.hashCode ^ currency.hashCode ^ balance.hashCode;
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
