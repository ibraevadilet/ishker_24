import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../entities/has_ip.dart';
import '../repositories/i_client_reposiitory.dart';

class HasIpUseCase implements UseCase<Result<HasIP?, Exception>, String> {
  HasIpUseCase(this._repository);

  final IClientRepository _repository;

  @override
  Future<Result<HasIP?, Exception>> call(deviceId) async =>
      _repository.hasIp(deviceId);
}
