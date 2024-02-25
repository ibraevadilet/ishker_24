import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/repositories/i_auth_repository.dart';

class ExitUseCase implements UseCase<Result<void, Exception>, String> {
  ExitUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<void, Exception>> call(String deviceId) async =>
      _repository.exit(deviceId);
}
