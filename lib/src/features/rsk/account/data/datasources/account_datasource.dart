import 'package:ishker_24/src/core/network/rsk_service.dart';

import '../models/account_model.dart';
import '../models/history_model.dart';
import '../models/history_request_model.dart';
import '../models/transfer_perform_body.dart';
import '../models/transfer_perform_model.dart';
import '../models/transfer_validate_body.dart';
import '../models/transfer_validate_model.dart';

class AccountDataSource {
  AccountDataSource(this._service);

  final RskService _service;

  Future<AccountModel> info(String account) async =>
      _service.accountInfo(account);

  Future<HistoryModel> history(HistoryRequestModel model) async =>
      _service.accountHistory(model);

  Future<TransferValidateModel> validateI2P(
    TransferValidateI2PBody body,
  ) async =>
      _service.validateI2P(body);

  Future<TransferPerformModel> performI2P(TransferPerformI2PBody body) async =>
      _service.performI2P(body);

  Future<TransferValidateModel> validateI2I(
    TransferValidateI2IBody body,
  ) async =>
      _service.validateI2I(body);

  Future<TransferPerformModel> performI2I(TransferPerformI2IBody body) async =>
      _service.performI2I(body);
}
