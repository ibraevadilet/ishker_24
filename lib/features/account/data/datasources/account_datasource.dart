import 'package:ishker_24/core/network/rsk_service.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_body.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_body.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_model.dart';

abstract interface class IAccountDataSource {
  Future<AccountModel> info(String account);
  Future<HistoryModel> history(HistoryRequestModel model);
  Future<TransferValidateModel> validateI2P(TransferValidateI2PBody body);
  Future<TransferPerformModel> performI2P(TransferPerformI2PBody body);
  Future<TransferValidateModel> validateI2I(TransferValidateI2IBody body);
  Future<TransferPerformModel> performI2I(TransferPerformI2IBody body);
}

final class AccountDataSourceImpl implements IAccountDataSource {
  AccountDataSourceImpl(this._service);

  final RskService _service;

  @override
  Future<AccountModel> info(String account) async => _service.info(account);

  @override
  Future<HistoryModel> history(HistoryRequestModel model) async =>
      _service.history(model);

  @override
  Future<TransferValidateModel> validateI2P(
    TransferValidateI2PBody body,
  ) async =>
      _service.validateI2P(body);

  @override
  Future<TransferPerformModel> performI2P(TransferPerformI2PBody body) async =>
      _service.performI2P(body);

  @override
  Future<TransferValidateModel> validateI2I(
    TransferValidateI2IBody body,
  ) async =>
      _service.validateI2I(body);

  @override
  Future<TransferPerformModel> performI2I(TransferPerformI2IBody body) async =>
      _service.performI2I(body);
}
