import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';

import '../../../../utils/constants.dart';

void main() {
  final params = HistoryParams(
    account: tHistoryRequestModel.account,
    startDate: tHistoryRequestModel.startDate,
    endDate: tHistoryRequestModel.endDate,
    page: tHistoryRequestModel.page,
    size: tHistoryRequestModel.size,
  );
  test(
    'HistoryParams props are correct',
    () => expect(
      params.props,
      equals(<Object?>[
        params.account,
        params.startDate,
        params.endDate,
        params.page,
        params.size,
      ]),
    ),
  );

  test(
    'HistoryParams.toModel() should return HistoryRequestModel object',
    () => expect(params.toModel(), tHistoryRequestModel),
  );
}
