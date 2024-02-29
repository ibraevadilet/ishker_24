import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';

abstract class AccountRepo {
  Future<AccountModel> info(String account);
  Future<HistoryModel> history(HistoryRequestModel model);
}
