import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/repositories/i_auth_repository.dart';

class GrnpCreateaUseCase
    implements UseCase<Result<String, Exception>, GrnpParams> {
  GrnpCreateaUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Result<String, Exception>> call(GrnpParams params) async =>
      _repository.sendGRNP(params);
}

final class GrnpParams extends Equatable {
  const GrnpParams({
    required this.id,
    required this.serial,
    required this.pin,
    required this.phone,
    required this.photo,
  });

  final String id;
  final String serial;
  final String pin;
  final String phone;
  final String photo;

  @override
  List<Object?> get props => [id, serial, pin, phone, photo];
}
