import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/constants.dart';

void main() {
  test(
    'TransferPerform props are correct',
    () => expect(
      tTransferPerform.props,
      equals(<Object?>[
        tTransferPerform.id,
        tTransferPerform.status,
        tTransferPerform.message,
        tTransferPerform.timestamp,
      ]),
    ),
  );
}
