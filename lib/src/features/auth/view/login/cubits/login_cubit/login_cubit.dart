import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required LoginUseCase loginUseCase,
    required AuthCubit authCubit,
  })  : _loginUseCase = loginUseCase,
        _authCubit = authCubit,
        super(LoginInitial());

  final LoginUseCase _loginUseCase;
  final AuthCubit _authCubit;

  void login(String login, String password) async {
    emit(LoginLoading());

    final result = await _loginUseCase.call(LoginParams(
      login: login,
      password: password,
      deviceId: _authCubit.deviceInfo.id,
      deviceName: _authCubit.deviceInfo.name,
    ));

    switch (result) {
      case Success():
        _authCubit.pin(login);
        emit(LoginSuccess(result.value..body.removeWhere((it) => !it.enabled)));
      case Failure():
        emit(LoginFailure(result.exception));
    }
  }
}
