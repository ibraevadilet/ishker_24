import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/constants.dart';

void main() {
  test(
    'HistoryParams props are correct',
    () => expect(
      tHistoryParams.props,
      equals(<Object?>[
        tHistoryParams.account,
        tHistoryParams.startDate,
        tHistoryParams.endDate,
        tHistoryParams.page,
        tHistoryParams.size,
      ]),
    ),
  );

  test(
    'HistoryParams.toModel() should return HistoryRequestModel object',
    () => expect(tHistoryParams.toModel(), tHistoryRequestModel),
  );
}
