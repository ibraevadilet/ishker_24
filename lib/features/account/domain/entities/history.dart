import 'package:equatable/equatable.dart';

class History extends Equatable {
  const History(this.pages, this.items);

  final int pages;
  final List<HistoryItem> items;

  static const empty = History(0, <HistoryItem>[]);

  History copyWith({int? pages, List<HistoryItem>? items}) =>
      History(pages ?? this.pages, items ?? this.items);

  @override
  List<Object?> get props => [pages, items];
}

class HistoryItem extends Equatable {
  const HistoryItem({
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

  bool get isPrihod => paytype == 'Приход';

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
