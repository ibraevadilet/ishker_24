import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../repositories/i_auth_repository.dart';

class ExistsUserUseCase implements UseCase<Result<void, Exception>, String> {
  ExistsUserUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<String, Exception>> call(String deviceId) async =>
      _repository.exists(deviceId);
}
