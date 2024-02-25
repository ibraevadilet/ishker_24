import 'package:ishker_24/src/core/usecases/usecase.dart';

import '../repositories/i_auth_repository.dart';

class GetCachedPinUseCase implements UseCase<String?, NoParams> {
  GetCachedPinUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<String?> call(NoParams params) async => _repository.pinCached;
}
