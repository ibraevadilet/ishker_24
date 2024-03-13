// import 'package:flutter_test/flutter_test.dart';
// import 'package:ishker_24/features/account/domain/usecases/transfer_perform_usecase.dart';

// import '../../../../utils/constants.dart';

// void main() {
//   final paramsModelV = TransferParams(
//     id: tTransferRequestModelV.id,
//     summa: tTransferRequestModelV.summa,
//     fee: tTransferRequestModelV.fee,
//     currency: tTransferRequestModelV.currency,
//     serviceid: tTransferRequestModelV.serviceid,
//     typeservice: tTransferRequestModelV.typeservice,
//     typerequest: tTransferRequestModelV.typerequest,
//     account: tTransferRequestModelV.account,
//     accountDt: tTransferRequestModelV.accountDt,
//     inn: tTransferRequestModelV.inn,
//   );

//   final paramsModelP = TransferParams(
//     id: tTransferRequestModelP.id,
//     summa: tTransferRequestModelP.summa,
//     fee: tTransferRequestModelP.fee,
//     currency: tTransferRequestModelP.currency,
//     serviceid: tTransferRequestModelP.serviceid,
//     typeservice: tTransferRequestModelP.typeservice,
//     typerequest: tTransferRequestModelP.typerequest,
//     account: tTransferRequestModelP.account,
//     accountDt: tTransferRequestModelP.accountDt,
//     inn: tTransferRequestModelP.inn,
//   );
//   test(
//     'TransferParams props are correct',
//     () => expect(
//       paramsModelV.props,
//       equals(<Object?>[
//         paramsModelV.id,
//         paramsModelV.summa,
//         paramsModelV.fee,
//         paramsModelV.currency,
//         paramsModelV.serviceid,
//         paramsModelV.typeservice,
//         paramsModelV.typerequest,
//         paramsModelV.account,
//         paramsModelV.accountDt,
//         paramsModelV.inn
//       ]),
//     ),
//   );

//   test(
//     'TransferParams.toModel() should return TransferRequestModel object for validating',
//     () => expect(paramsModelV.toModel(), tTransferRequestModelV),
//   );
//   test(
//     'TransferParams.toModel() should return TransferRequestModel object for performing',
//     () => expect(paramsModelP.toModel(), tTransferRequestModelP),
//   );

//   group('TransferParams.copyWith()', () {
//     test(
//       'returns the same object if not arguments are provided',
//       () => expect(paramsModelV.copyWith(), equals(paramsModelV)),
//     );

//     test(
//       'retains the old value for every parameter if null is provided',
//       () => expect(
//         paramsModelV.copyWith(summa: null, id: null),
//         equals(paramsModelV),
//       ),
//     );

//     test(
//       'replaces non-null parameter',
//       () => expect(
//         paramsModelV.copyWith(
//           id: paramsModelP.id,
//           typerequest: paramsModelP.typerequest,
//         ),
//         equals(paramsModelP),
//       ),
//     );
//   });
// }
