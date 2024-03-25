import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';

import '../entities/client_info.dart';
import '../repositories/i_client_reposiitory.dart';

class ClientInfoUseCase
    implements UseCase<Result<ClientInfo, Exception>, String> {
  ClientInfoUseCase(this._repository);

  final IClientRepository _repository;

  @override
  Future<Result<ClientInfo, Exception>> call(pin) async =>
      _repository.clientInfo(pin);
}
