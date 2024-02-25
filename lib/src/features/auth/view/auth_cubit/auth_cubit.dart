import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/data/models/ishker_auth_model.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/exit_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.deviceInfo, {
    required ExitUseCase exitUseCase,
  })  : _exitUseCase = exitUseCase,
        super(const AuthState());

  final AppDeviceInfo deviceInfo;
  final ExitUseCase _exitUseCase;

  void pin(String pin) => emit(state.copyWith(pin: pin));
  void persistentToken(String persistentToken) =>
      emit(state.copyWith(persistentToken: persistentToken));

  void success(IshkerAuthModel model) =>
      emit(state.copyWith(authModel: model, status: Authenticated()));

  void exit() async {
    final result = await _exitUseCase.call(deviceInfo.id);
    if (result is Success) emit(const AuthState());
  }
}
