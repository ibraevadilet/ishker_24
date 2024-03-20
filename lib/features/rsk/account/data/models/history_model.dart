import 'package:equatable/equatable.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/history.dart';

class HistoryModel extends Equatable {
  const HistoryModel(this.pages, this.items);

  final int pages;
  final List<HistoryItemModel> items;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        json["pages_num"] as int,
        (json["rows"] as List)
            .map((e) => HistoryItemModel.fromJson(e))
            .toList(),
      );

  History toEntity() => History(pages, items.map((e) => e.toEntity()).toList());

  @override
  List<Object?> get props => [pages, items];
}

class HistoryItemModel extends Equatable {
  const HistoryItemModel({
    required this.transactionid,
    required this.amount,
    required this.currency,
    required this.paytype,
    required this.paydate,
    required this.trandate,
    required this.receiverAccount,
    required this.ground,
    required this.payerName,
    required this.payerBankname,
    required this.isCommision,
  });

  final String transactionid;
  final num amount;
  final String currency;
  final String paytype;
  final DateTime paydate;
  final DateTime trandate;
  final String receiverAccount;
  final String ground;
  final String payerName;
  final String payerBankname;
  final bool isCommision;

  factory HistoryItemModel.fromJson(Map<String, dynamic> json) =>
      HistoryItemModel(
        transactionid: json["transactionid"],
        amount: json["amount"],
        currency: json["currency"],
        paytype: json["paytype"],
        paydate: AppDateFormats.formatDdMMYyyy.parse((json["paydate"])),
        trandate: AppDateFormats.formatDdMMYyyy.parse(json["trandate"]),
        receiverAccount: json["receiver_account"],
        ground: json['ground'],
        payerName: json['payer_name'],
        payerBankname: json['payer_bankname'],
        isCommision: (json['is_commision'] as String) != '0',
      );

  HistoryItem toEntity() => HistoryItem(
        transactionid: transactionid,
        amount: amount,
        currency: currency,
        paytype: paytype,
        paydate: paydate,
        trandate: trandate,
        receiverAccount: receiverAccount,
        ground: ground,
        payerName: payerName,
        payerBankname: payerBankname,
        isCommision: isCommision,
      );

  @override
  List<Object?> get props => [
        transactionid,
        amount,
        currency,
        paytype,
        paydate,
        trandate,
        receiverAccount,
        ground,
        payerName,
        payerBankname,
        isCommision,
      ];
}
