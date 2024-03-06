import 'package:dio/dio.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_model.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';

final tDioException = DioException(
  requestOptions: RequestOptions(),
  response: Response(
    requestOptions: RequestOptions(),
    data: {"detail": "message"},
  ),
);

const tAccountModel = AccountModel(
  account: '1234567890',
  currency: '417',
  bic: 'bic',
  depname: 'depname',
  address: 'address',
  pin: '123',
  amount: 1000,
  amountFree: 900,
  amountUnfree: 100,
);

final tAccount = Account(
  account: tAccountModel.account,
  currency: tAccountModel.currency,
  bic: tAccountModel.bic,
  depname: tAccountModel.depname,
  address: tAccountModel.address,
  pin: tAccountModel.pin,
  amount: tAccountModel.amount,
  amountFree: tAccountModel.amountFree,
  amountUnfree: tAccountModel.amountUnfree,
);

final tHistoryItemModel = HistoryItemModel(
  transactionid: 'transactionid',
  amount: 100.0,
  currency: '417',
  paytype: 'Приход',
  paydate: DateTime(2024, 2, 12),
  trandate: DateTime(2024, 2, 12),
  receiverAccount: 'receiverAccount',
  ground: 'ground',
  payerName: 'payerName',
  payerBankname: 'payerBankname',
  isCommision: false,
);

final tHistoryItem = HistoryItem(
  transactionid: tHistoryItemModel.transactionid,
  amount: tHistoryItemModel.amount,
  currency: tHistoryItemModel.currency,
  paytype: tHistoryItemModel.paytype,
  paydate: tHistoryItemModel.paydate,
  trandate: tHistoryItemModel.trandate,
  receiverAccount: tHistoryItemModel.receiverAccount,
  ground: tHistoryItemModel.ground,
  payerName: tHistoryItemModel.payerName,
  payerBankname: tHistoryItemModel.payerBankname,
  isCommision: tHistoryItemModel.isCommision,
);

final tHistoryModel = HistoryModel(1, [tHistoryItemModel]);
final tHistory = History(1, [tHistoryItem]);

final tHistoryRequestModel = HistoryRequestModel(
  account: tAccount.account,
  startDate: DateTime(2024, 2, 12),
  endDate: DateTime(2024, 2, 28),
  page: 1,
  size: 10,
);

const tTransferValidateModel = TransferValidateModel(
  id: 38463209,
  status: 0,
  fio: "И.А.Н.",
  account: "4724144078984592",
);

final tTransferValidate = TransferValidate(
  id: tTransferValidateModel.id,
  status: tTransferValidateModel.status,
  fio: tTransferValidateModel.fio,
  account: tTransferValidateModel.account,
);

final tTransferPerformModel = TransferPerformModel(
  id: "38463209",
  status: "0",
  message: "Операция завершена успешно",
  timestamp: DateTime.parse("2024-02-28T11:38:43+06:00"),
);
final tTransferPerform = TransferPerform(
  id: tTransferPerformModel.id,
  status: tTransferPerformModel.status,
  message: tTransferPerformModel.message,
  timestamp: tTransferPerformModel.timestamp,
);

const tTransferRequestModelV = TransferRequestModel(
  summa: 1000,
  fee: 0,
  currency: '417',
  serviceid: '38983092454',
  typeservice: 'popolnenie_card_pan',
  typerequest: 'validate',
  account: '4724144078984592',
  accountDt: '1290583310042253',
  inn: '20509199801631',
);

const tTransferRequestModelP = TransferRequestModel(
  id: 38463209,
  summa: 1000,
  fee: 0,
  currency: '417',
  serviceid: '38983092454',
  typeservice: 'popolnenie_card_pan',
  typerequest: 'pay',
  account: '4724144078984592',
  accountDt: '1290583310042253',
  inn: '20509199801631',
);
