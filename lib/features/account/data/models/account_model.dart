class AccountModel {
  AccountModel({
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

  @override
  bool operator ==(Object other) =>
      other is AccountModel &&
      account == other.account &&
      currency == other.currency &&
      bic == other.bic &&
      depname == other.depname &&
      address == other.address &&
      pin == other.pin &&
      amount == other.amount &&
      amountFree == other.amountFree &&
      amountUnfree == other.amountUnfree;

  @override
  int get hashCode => Object.hash(
        account,
        currency,
        bic,
        depname,
        address,
        pin,
        amount,
        amountFree,
        amountUnfree,
      );
}
