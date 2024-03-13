// import 'package:flutter_test/flutter_test.dart';

// import '../../../../utils/constants.dart';

// void main() {
//   final jsonToValidate = {
//     "summa": 1000,
//     "fee": 0,
//     "currency": "417",
//     "serviceid": "38983092454",
//     "typeservice": "popolnenie_card_pan",
//     "typerequest": "validate",
//     "account": "4724144078984592",
//     "account_dt": "1290583310042253",
//     "inn": "20509199801631",
//   };

//   final jsonToPerform = {
//     "id": 38463209,
//     "summa": 1000,
//     "fee": 0,
//     "currency": "417",
//     "serviceid": "38983092454",
//     "typeservice": "popolnenie_card_pan",
//     "typerequest": "pay",
//     "account": "4724144078984592",
//     "account_dt": "1290583310042253",
//     "inn": "20509199801631",
//   };

//   test(
//     'TransferRequestModel.toValidateJson() should return a valid Map',
//     () async => expect(
//       tTransferRequestModelV.toValidateJson(),
//       equals(jsonToValidate),
//     ),
//   );

//   test(
//     'TransferRequestModel.toPerformJson() should return a valid Map',
//     () async => expect(
//       tTransferRequestModelP.toPerformJson(),
//       equals(jsonToPerform),
//     ),
//   );

//   test(
//     'TransferRequestModel to validate props are correct',
//     () => expect(
//       tTransferRequestModelV.props,
//       equals(<Object?>[
//         null,
//         tTransferRequestModelV.summa,
//         tTransferRequestModelV.fee,
//         tTransferRequestModelV.currency,
//         tTransferRequestModelV.serviceid,
//         tTransferRequestModelV.typeservice,
//         tTransferRequestModelV.typerequest,
//         tTransferRequestModelV.account,
//         tTransferRequestModelV.accountDt,
//         tTransferRequestModelV.inn,
//       ]),
//     ),
//   );

//   test(
//     'TransferRequestModel to perform props are correct',
//     () => expect(
//       tTransferRequestModelP.props,
//       equals(<Object?>[
//         tTransferRequestModelP.id,
//         tTransferRequestModelP.summa,
//         tTransferRequestModelP.fee,
//         tTransferRequestModelP.currency,
//         tTransferRequestModelP.serviceid,
//         tTransferRequestModelP.typeservice,
//         tTransferRequestModelP.typerequest,
//         tTransferRequestModelP.account,
//         tTransferRequestModelP.accountDt,
//         tTransferRequestModelP.inn,
//       ]),
//     ),
//   );
// }
