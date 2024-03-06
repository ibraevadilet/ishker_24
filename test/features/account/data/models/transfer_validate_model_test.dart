import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_model.dart';

import '../../../../utils/constants.dart';

void main() {
  final json = {
    "id": 38463209,
    "status": 0,
    "fio": "И.А.Н.",
    "account": "4724144078984592"
  };

  test(
    'TransferValidateModel.fromJson() should return a valid model when a valid JSON is given ',
    () async => expect(
        TransferValidateModel.fromJson(json), equals(tTransferValidateModel)),
  );

  test(
    'TransferValidateModel.toEntity() should return a valid TransferValidate entity',
    () async => expect(
      tTransferValidateModel.toEntity(),
      equals(tTransferValidate),
    ),
  );

  test(
    'TransferValidateModel props are correct',
    () => expect(
      tTransferValidateModel.props,
      equals(<Object?>[
        tTransferValidateModel.id,
        tTransferValidateModel.status,
        tTransferValidateModel.fio,
        tTransferValidateModel.account,
      ]),
    ),
  );
}
