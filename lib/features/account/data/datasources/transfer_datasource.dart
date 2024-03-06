import 'package:ishker_24/core/network/rsk_service.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_perform_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_request_model.dart';
import 'package:ishker_24/features/account/data/models/transfer_validate_model.dart';

abstract interface class ITransfersDataSource {
  Future<AccountModel> info(String account);
  Future<HistoryModel> history(HistoryRequestModel model);
  Future<TransferValidateModel> validate(TransferRequestModel body);
  Future<TransferPerformModel> perform(TransferRequestModel body);
}

final class TransfersDataSourceImpl implements ITransfersDataSource {
  TransfersDataSourceImpl(this._service);

  final RskService _service;

  @override
  Future<AccountModel> info(String account) async => _service.info(account);

  @override
  Future<HistoryModel> history(HistoryRequestModel model) async =>
      _service.history(model);

  @override
  Future<TransferValidateModel> validate(TransferRequestModel model) async =>
      _service.validate(model);

  @override
  Future<TransferPerformModel> perform(TransferRequestModel model) async =>
      _service.perform(model);
}
