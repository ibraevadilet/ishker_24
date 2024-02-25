import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/data/models/ishker_auth_model.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';

import '../entity/confirm_code_entity.dart';
import '../usecases/confirm_code_usecase.dart';
import '../usecases/get_confirm_code_usecase.dart';
import '../usecases/grnp_create_use_case.dart';
import '../usecases/login_usecase.dart';
import '../usecases/pincode_enter_usecase.dart';
import '../usecases/pincode_new_usecase.dart';
import '../usecases/pincode_set_usecase.dart';

abstract class IAuthRepository {
  Future<Result<String, Exception>> exists(String deviceId);
  Future<Result<AuthEntity, Exception>> auth(LoginParams params);

  Future<String?> get pinCached;
  Future<Result<void, Exception>> cachePin(String pin);

  Future<String?> get pinCodeCached;
  Future<Result<void, Exception>> pinCodeSet(PinCodeSetParams params);
  Future<Result<void, Exception>> pinCodeNew(PinCodeNewParams params);
  Future<Result<IshkerAuthModel, Exception>> pinCodeEnter(
    PinCodeEnterParams params,
  );

  Future<Result<void, Exception>> getConfirmCode(GetConfirmCodeParams params);
  Future<Result<ConfirmCodeEntity, Exception>> confirmRecievedCode(
    ConfirmCodeParams params,
  );

  Future<Result<String, Exception>> terms(String path);

  Future<Result<bool, Exception>> checkGRNP(String pin);
  Future<Result<String, Exception>> sendGRNP(GrnpParams params);

  Future<Result<void, Exception>> exit(String deviceId);
}
