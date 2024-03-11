import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/constants.dart';

void main() {
  test(
    'TransferValidate props are correct',
    () => expect(
      tTransferValidate.props,
      equals(<Object?>[
        tTransferValidate.id,
        tTransferValidate.status,
        tTransferValidate.fio,
        tTransferValidate.account,
      ]),
    ),
  );
}
