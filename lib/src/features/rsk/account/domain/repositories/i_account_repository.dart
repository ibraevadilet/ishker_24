import 'package:ishker_24/src/core/utils/result.dart';

import '../entities/account.dart';
import '../entities/history.dart';
import '../entities/transfer_perform.dart';
import '../entities/transfer_validate.dart';
import '../usecases/history_usecase.dart';
import '../usecases/transfer_perform_i2i_usecase.dart';
import '../usecases/transfer_perform_i2p_usecase.dart';
import '../usecases/transfer_validate_i2i_usecase.dart';
import '../usecases/transfer_validate_i2p_usecase.dart';

abstract interface class IAccountRepository {
  Future<Result<Account, Exception>> info(String account);
  Future<Result<History, Exception>> history(HistoryParams params);
  Future<Result<TransferValidate, Exception>> validateI2P(
    TransferValidateI2PParams params,
  );
  Future<Result<TransferPerform, Exception>> performI2P(
    TransferPerformI2PParams params,
  );
  Future<Result<TransferValidate, Exception>> validateI2I(
    TransferValidateI2IParams params,
  );
  Future<Result<TransferPerform, Exception>> performI2I(
    TransferPerformI2IParams params,
  );
}
