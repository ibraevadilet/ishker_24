import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/client/domain/entities/client_info.dart';
import 'package:ishker_24/features/rsk/client/domain/repositories/i_rsk_reposiitory.dart';

class ClientInfoUseCase
    implements UseCase<Result<ClientInfo, Exception>, String> {
  ClientInfoUseCase(this._repository);

  final IRskRepository _repository;

  @override
  Future<Result<ClientInfo, Exception>> call(pin) async =>
      _repository.clientInfo(pin);
}
