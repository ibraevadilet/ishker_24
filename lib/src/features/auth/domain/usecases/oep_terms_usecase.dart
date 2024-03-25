import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_signup_repository.dart';

class OepTermsUseCase implements UseCase<Result<String, Exception>, String> {
  OepTermsUseCase(this._repository);

  final ISignUpRepository _repository;

  @override
  Future<Result<String, Exception>> call(String path) async =>
      _repository.terms(path);
}
