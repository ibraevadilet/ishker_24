import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/signup/domain/repositories/i_signup_repository.dart';

class SignUpUseCase
    implements UseCase<Result<String, Exception>, SignUpParams> {
  SignUpUseCase(this._repository);

  final ISignUpRepository _repository;

  @override
  Future<Result<String, Exception>> call(
    SignUpParams params,
  ) async =>
      _repository.signup(params);
}

final class SignUpParams extends Equatable {
  const SignUpParams({
    required this.pin,
    required this.phone,
    required this.esiaAccepted,
    required this.passportSeries,
    required this.passportNumber,
    required this.email,
    required this.photo,
  });

  final String pin;
  final String phone;
  final bool esiaAccepted;
  final String passportSeries;
  final String passportNumber;
  final String email;
  final String photo;

  @override
  List<Object?> get props => [
        pin,
        phone,
        esiaAccepted,
        passportSeries,
        passportNumber,
        email,
        photo,
      ];
}
