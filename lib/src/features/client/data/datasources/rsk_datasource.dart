import 'package:ishker_24/src/core/network/rsk_service.dart';

import '../../../rsk/account/data/models/account_model.dart';
import '../models/client_info_model.dart';
import '../../../rsk/account/data/models/history_model.dart';
import '../../../rsk/account/data/models/history_request_model.dart';
import '../../../rsk/account/data/models/transfer_perform_body.dart';
import '../../../rsk/account/data/models/transfer_perform_model.dart';
import '../../../rsk/account/data/models/transfer_validate_body.dart';
import '../../../rsk/account/data/models/transfer_validate_model.dart';

class RskDataSource {
  RskDataSource(this._service);

  final RskService _service;

  Future<ClientInfoModel> info(String pin) async => _service.clientInfo(pin);
  Future<bool> hasBank(String pin) async => _service.hasBank(pin);

  Future<AccountModel> accountInfo(String account) async =>
      _service.accountInfo(account);

  Future<HistoryModel> accountHistory(HistoryRequestModel model) async =>
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
