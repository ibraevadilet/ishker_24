import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/confirm_code_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/get_confirm_code_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

part 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  ConfirmCubit({
    required AppDeviceInfo deviceInfo,
    required GetConfirmCodeUseCase getConfirmCodeUseCase,
    required ConfirmCodeUseCase confirmCodeUseCase,
    required AuthCubit authCubit,
    required String twoFactorToken,
  })  : _deviceInfo = deviceInfo,
        _getConfirmCodeUseCase = getConfirmCodeUseCase,
        _confirmCodeUseCase = confirmCodeUseCase,
        _authCubit = authCubit,
        _twoFactorToken = twoFactorToken,
        super(ConfirmInitial());

  final AppDeviceInfo _deviceInfo;
  final GetConfirmCodeUseCase _getConfirmCodeUseCase;
  final ConfirmCodeUseCase _confirmCodeUseCase;
  // final String _pin;
  final String _twoFactorToken;
  final AuthCubit _authCubit;

  void getConfirmCode(String method, String token) async {
    emit(ConfirmSending(method: method));

    final result = await _getConfirmCodeUseCase.call(
      GetConfirmCodeParams(method, token),
    );

    emit(switch (result) {
      Success() => ConfirmSended(token, method: method),
      Failure() => ConfirmFailure(result.exception, method: method),
    });
  }

  void confirm(String method, String code) async {
    emit(ConfirmConfirming(method: method));

    final result = await _confirmCodeUseCase.call(ConfirmCodeParams(
      method: method,
      pin: _authCubit.state.pin,
      deviceId: _deviceInfo.id,
      twoFactorSessionToken: _twoFactorToken,
      verificationCode: code,
    ));

    emit(switch (result) {
      Success() => ConfirmConfirmed(result.value, method: method),
      Failure() => ConfirmFailure(result.exception, method: method),
    });
  }
}
