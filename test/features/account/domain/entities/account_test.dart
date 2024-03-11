import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/constants.dart';

void main() {
  test(
    'Account props are correct',
    () => expect(
      tAccount.props,
      equals(<Object?>[
        tAccount.account,
        tAccount.currency,
        tAccount.bic,
        tAccount.depname,
        tAccount.address,
        tAccount.pin,
        tAccount.amount,
        tAccount.amountFree,
        tAccount.amountUnfree,
      ]),
    ),
  );
}
