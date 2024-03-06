import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';

import '../../../../utils/constants.dart';

void main() {
  final jsonItem = {
    'transactionid': 'transactionid',
    'amount': 100.0,
    'currency': '417',
    'paytype': 'Приход',
    'paydate': '12.02.2024',
    'trandate': '12.02.2024',
    'receiver_account': 'receiverAccount',
    'ground': 'ground',
    'payer_name': 'payerName',
    'payer_bankname': 'payerBankname',
    'is_commision': '0',
  };

  final json = {
    'pages_num': 1,
    'rows': [jsonItem]
  };

  group('HistoryItemModel', () {
    test(
      '.fromJson() should return a valid model when a valid JSON is given ',
      () async => expect(
          HistoryItemModel.fromJson(jsonItem), equals(tHistoryItemModel)),
    );

    test(
      '.toEntity() should return a valid TransferValidate entity',
      () async => expect(tHistoryItemModel.toEntity(), equals(tHistoryItem)),
    );

    test(
      'props are correct',
      () => expect(
        tHistoryItemModel.props,
        equals(<Object?>[
          tHistoryItemModel.transactionid,
          tHistoryItemModel.amount,
          tHistoryItemModel.currency,
          tHistoryItemModel.paytype,
          tHistoryItemModel.paydate,
          tHistoryItemModel.trandate,
          tHistoryItemModel.receiverAccount,
          tHistoryItemModel.ground,
          tHistoryItemModel.payerName,
          tHistoryItemModel.payerBankname,
          tHistoryItemModel.isCommision,
        ]),
      ),
    );
  });

  group('HistoryModel', () {
    test(
      '.fromJson() should return a valid model when a valid JSON is given ',
      () async => expect(HistoryModel.fromJson(json), equals(tHistoryModel)),
    );

    test(
      '.toEntity() should return a valid History entity',
      () async => expect(tHistoryModel.toEntity(), equals(tHistory)),
    );

    test(
      'props are correct',
      () => expect(
        tHistoryModel.props,
        equals(<Object?>[tHistoryModel.pages, tHistoryModel.items]),
      ),
    );
  });
}
