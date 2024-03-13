import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/account.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/account/domain/entities/transfer_validate.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_perform_i2p_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2i_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/transfer_validate_i2p_usecase.dart';

abstract class IAccountRepository {
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
