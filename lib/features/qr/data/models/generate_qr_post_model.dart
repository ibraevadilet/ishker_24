class GenerateQrPostModel {
  final String account;
  final String amount;
  final String pin;
  final String serviceName;
  final String comments;
  final String mcc;
  final String currency;
  GenerateQrPostModel({
    required this.account,
    required this.amount,
    required this.pin,
    required this.serviceName,
    required this.comments,
    required this.mcc,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'account': account,
      'amount': amount,
      'pin': pin,
      'serviceName': serviceName,
      'comments': comments,
      'mcc': mcc,
      'currency': currency,
    };
  }
}
