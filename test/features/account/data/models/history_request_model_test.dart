import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/constants.dart';

void main() {
  final json = {
    'account': tAccount.account,
    'startDate': '2024-02-12T00:00:00.000',
    'endDate': '2024-02-28T00:00:00.000',
    'page': 1,
    'size': 10,
  };

  test(
    'HistoryRequestModel.toJson() should return a valid Map',
    () async => expect(tHistoryRequestModel.toJson(), equals(json)),
  );

  test(
    'HistoryRequestModel props are correct',
    () => expect(
      tHistoryRequestModel.props,
      equals(<Object?>[
        tHistoryRequestModel.account,
        tHistoryRequestModel.startDate,
        tHistoryRequestModel.endDate,
        tHistoryRequestModel.page,
        tHistoryRequestModel.size,
      ]),
    ),
  );
}
