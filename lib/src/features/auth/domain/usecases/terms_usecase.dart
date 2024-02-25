import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/repositories/i_auth_repository.dart';

class TermsUseCase implements UseCase<Result<String, Exception>, String> {
  TermsUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<String, Exception>> call(String path) async =>
      _repository.terms(path);
}
