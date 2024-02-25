import 'package:ishker_24/src/core/usecases/usecase.dart';

import '../repositories/i_auth_repository.dart';

class PinCodeCachedUseCase implements UseCase<String?, NoParams> {
  PinCodeCachedUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<String?> call(NoParams params) async => _repository.pinCodeCached;
}
