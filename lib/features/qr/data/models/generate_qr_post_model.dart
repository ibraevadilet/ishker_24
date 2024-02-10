class GenerateQrPostModel {
  final String account;
  final String tspName;
  final String serviceName;
  final String comments;
  final String mcc;
  final String currency;
  final String amount;
  final String payerNameLat;
  GenerateQrPostModel({
    required this.account,
    required this.tspName,
    required this.serviceName,
    required this.comments,
    required this.mcc,
    required this.currency,
    required this.amount,
    required this.payerNameLat,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'account': account,
      'tspName': tspName,
      'serviceName': serviceName,
      'comments': comments,
      'mcc': mcc,
      'currency': currency,
      'amount': amount,
      'payerNameLat': payerNameLat,
    };
  }
}
