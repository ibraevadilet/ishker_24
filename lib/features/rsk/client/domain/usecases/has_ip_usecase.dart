import 'package:ishker_24/core/usecases/usecase.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/client/domain/entities/has_ip.dart';
import 'package:ishker_24/features/rsk/client/domain/repositories/i_rsk_reposiitory.dart';

class HasIpUseCase implements UseCase<Result<HasIP?, Exception>, String> {
  HasIpUseCase(this._repository);

  final IRskRepository _repository;

  @override
  Future<Result<HasIP?, Exception>> call(deviceId) async =>
      _repository.hasIp(deviceId);
}
