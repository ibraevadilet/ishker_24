import 'package:ishker_24/src/core/utils/result.dart';

import '../usecases/signup_usecase.dart';

abstract interface class ISignUpRepository {
  Future<Result<String, Exception>> signup(SignUpParams params);
  Future<Result<String, Exception>> terms(String path);
}
