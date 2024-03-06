import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';

void main() {
  group('HistoryItem', () {
    test('props are correct', () {
      final item = HistoryItem(
        transactionid: 'transactionid',
        amount: 100.0,
        currency: '417',
        paytype: 'type',
        paydate: DateTime(2024, 2, 12),
        trandate: DateTime(2024, 2, 12),
        receiverAccount: 'receiverAccount',
        ground: 'ground',
        payerName: 'payerName',
        payerBankname: 'payerBankname',
        isCommision: false,
      );
    });
  });
}
