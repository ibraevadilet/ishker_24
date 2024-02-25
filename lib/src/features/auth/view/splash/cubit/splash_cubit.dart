import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/get_cached_pin_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_cached_usecase.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';

import '../../../domain/usecases/exists_user_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required String deviceId,
    required AuthCubit authCubit,
    required ExistsUserUseCase existsUserUseCase,
    required GetCachedPinUseCase cachedPinUseCase,
    required PinCodeCachedUseCase pinCodeCachedUseCase,
  })  : _deviceId = deviceId,
        _authCubit = authCubit,
        _existsUserUseCase = existsUserUseCase,
        _cachedPinUseCase = cachedPinUseCase,
        _pinCodeCachedUseCase = pinCodeCachedUseCase,
        super(SplashInitial());

  final String _deviceId;
  final AuthCubit _authCubit;
  final ExistsUserUseCase _existsUserUseCase;
  final GetCachedPinUseCase _cachedPinUseCase;
  final PinCodeCachedUseCase _pinCodeCachedUseCase;

  Future<void> init() async {
    dev.log("чекаем устройство: $_deviceId");
    // если успешно, то получается что юзера знают на стороне сервера,
    final result = await _existsUserUseCase.call(_deviceId);

    switch (result) {
      case Success():
        if (result.value.isNotEmpty) {
          dev.log("response pin: ${result.value}");

          // тянем пин и пинкод из кэша, null если пусто
          final pin = await _cachedPinUseCase.call(NoParams());
          dev.log('pin: $pin');

          final code = await _pinCodeCachedUseCase.call(NoParams());
          dev.log('code: $code');

          // проверяем соответствует ли закэшированный пин ответу сервера
          // и чекаем пинкод на null и пустоту
          if (pin != null &&
              pin == result.value &&
              code != null &&
              code.isNotEmpty) {
            _authCubit.pin(pin);
            emit(SplashSuccess());

            return;
          }
        }
        emit(SplashFailure(UserNotExistsException()));

      case Failure():
        emit(SplashFailure(result.exception));
    }
  }
}
