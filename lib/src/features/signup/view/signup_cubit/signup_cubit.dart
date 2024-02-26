import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required SignUpUseCase signUpUseCase,
  })  : _signUpUseCase = signUpUseCase,
        super(const SignUpState());

  final SignUpUseCase _signUpUseCase;

  void userData({
    required String passSeries,
    required String passNumbers,
    required String pin,
    required String phone,
    required String email,
  }) =>
      emit(state.copyWith(
        passSeries: passSeries,
        passNumbers: passNumbers,
        pin: pin,
        phone: phone,
        email: email,
      ));

  void register(String photo) async {
    emit(state.copyWith(status: RequestLoading()));

    final result = await _signUpUseCase.call(SignUpParams(
      pin: state.pin,
      phone: state.phone,
      esiaAccepted: true,
      passportSeries: state.passSeries,
      passportNumber: state.passNumbers,
      email: state.email,
      photo: photo,
    ));

    emit(state.copyWith(
      status: switch (result) {
        Success() => RequestSuccess(),
        Failure() => RequestFailure(result.exception),
      },
    ));
  }
}
