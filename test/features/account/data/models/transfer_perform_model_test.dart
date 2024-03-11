import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_model.dart';

import '../../../../utils/constants.dart';

void main() {
  final json = {
    "id": "38463209",
    "status": "0",
    "message": "Операция завершена успешно",
    "timestamp": "2024-02-28T11:38:43+06:00",
  };

  test(
    'TransferPerformModel.fromJson() should return a valid model when a valid JSON is given ',
    () async => expect(
        TransferPerformModel.fromJson(json), equals(tTransferPerformModel)),
  );

  test(
    'TransferPerformModel.toEntity() should return a valid TransferValidate entity',
    () async => expect(
      tTransferPerformModel.toEntity(),
      equals(tTransferPerform),
    ),
  );

  test(
    'TransferPerformModel props are correct',
    () => expect(
      tTransferPerformModel.props,
      equals(<Object?>[
        tTransferPerformModel.id,
        tTransferPerformModel.status,
        tTransferPerformModel.message,
        tTransferPerformModel.timestamp,
      ]),
    ),
  );
}
