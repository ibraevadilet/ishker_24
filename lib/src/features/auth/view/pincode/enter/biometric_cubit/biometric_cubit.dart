import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/usecases/usecase.dart';
import 'package:ishker_24/src/core/utils/extensions.dart';
import 'package:ishker_24/src/core/utils/result.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/get_cached_pin_usecase.dart';
import 'package:ishker_24/src/features/auth/view/pincode/enter/pincode_enter_cubit/pincode_enter_cubit.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

part 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  BiometricCubit({
    required GetCachedPinUseCase cachedPinCodeUseCase,
    required PinCodeEnterCubit pinCodeEnterCubit,
  })  : _cachedPinCodeUseCase = cachedPinCodeUseCase,
        _pinCodeEnterCubit = pinCodeEnterCubit,
        super(BiometricInitial());

  final GetCachedPinUseCase _cachedPinCodeUseCase;
  final PinCodeEnterCubit _pinCodeEnterCubit;

  final auth = LocalAuthentication();

  void init() async {
    dev.log("BiometricCubit.init()");
    final isSupported = await auth.isDeviceSupported();
    dev.log("BiometricCubit.isSupported = $isSupported");

    if (!isSupported) return;

    final cacheResult = await _cachedPinCodeUseCase.call(NoParams());
    if (cacheResult is Failure) return;

    final availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) return;

    if (availableBiometrics.contains(BiometricType.face)) {
      emit(const BiometricSupported(
        isSupported: true,
        type: BiometricType.face,
      ));

      await Future.delayed(Duration.zero);

      check();
    }
  }

  void check() async {
    final code = await _cachedPinCodeUseCase.call(NoParams());
    if (code.isNullOrEmpty) return;

    final bool didAuthenticate = await auth.authenticate(
      authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Tunduk',
          biometricHint: 'Используйте сканер отпечатка пальца для авторизации',
          cancelButton: 'Нет, спасибо',
        ),
        IOSAuthMessages(cancelButton: 'Нет, спасибо'),
      ],
      localizedReason: 'Авторизуйтесь, чтобы продолжить',
      options: const AuthenticationOptions(biometricOnly: true),
    );

    if (didAuthenticate) _pinCodeEnterCubit.send(code!);
  }
}
