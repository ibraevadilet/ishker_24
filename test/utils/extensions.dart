import 'package:ishker_24/features/account/data/models/history_request_model.dart';
// import 'package:ishker_24/features/account/data/models/old/transfer_request_model.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
// import 'package:ishker_24/features/account/domain/usecases/transfer_perform_usecase.dart';

// extension TransferRequestModelX on TransferRequestModel {
//   TransferParams toParams() => TransferParams(
//         id: id,
//         fee: fee,
//         summa: summa,
//         currency: currency,
//         serviceid: serviceid,
//         typeservice: typeservice,
//         typerequest: typerequest,
//         account: account,
//         accountDt: accountDt,
//         inn: inn,
//       );
// }

extension HistoryRequestModelX on HistoryRequestModel {
  HistoryParams toParams() => HistoryParams(
        account: account,
        startDate: startDate,
        endDate: endDate,
        page: page,
        size: size,
      );
}
