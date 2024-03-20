import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/account.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/history.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/rsk/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/rsk/account/domain/usecases/transfer_perform_usecase.dart';

abstract class IAccountRepository {
  Future<Result<Account, Exception>> info(String account);
  Future<Result<History, Exception>> history(HistoryParams params);
  Future<Result<TransferValidate, Exception>> validate(TransferParams params);
  Future<Result<TransferPerform, Exception>> perform(TransferParams params);
}
