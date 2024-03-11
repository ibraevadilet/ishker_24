import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';

import '../../../../utils/constants.dart';

void main() {
  group('HistoryItem', () {
    test(
      'props are correct',
      () => expect(
        tHistoryItem.props,
        equals(<Object?>[
          tHistoryItem.transactionid,
          tHistoryItem.amount,
          tHistoryItem.currency,
          tHistoryItem.paytype,
          tHistoryItem.paydate,
          tHistoryItem.trandate,
          tHistoryItem.receiverAccount,
          tHistoryItem.ground,
          tHistoryItem.payerName,
          tHistoryItem.payerBankname,
          tHistoryItem.isCommision,
        ]),
      ),
    );

    test(
      '.isPrihod() should return true if paytype is Приход',
      () => expect(tHistoryItem.isPrihod, true),
    );
  });

  group('History', () {
    test(
      'props are correct',
      () => expect(
        tHistory.props,
        equals(<Object?>[tHistory.pages, tHistory.items]),
      ),
    );

    group('.copyWith()', () {
      test(
        'returns the same object if not arguments are provided',
        () => expect(tHistory.copyWith(), equals(tHistory)),
      );

      test(
        'retains the old value for every parameter if null is provided',
        () => expect(
          tHistory.copyWith(pages: null, items: null),
          equals(tHistory),
        ),
      );

      test(
        'replaces one non-null parameter',
        () => expect(
          tHistory.copyWith(items: []),
          equals(History(tHistory.pages, const [])),
        ),
      );

      test(
        'replaces every non-null parameter',
        () => expect(
          History.empty.copyWith(pages: tHistory.pages, items: tHistory.items),
          equals(tHistory),
        ),
      );
    });
  });
}
