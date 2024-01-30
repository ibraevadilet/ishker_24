import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/pin_code_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'biometric_cubit.freezed.dart';
part 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  BiometricCubit({
    required this.useCase,
    required this.prefs,
  }) : super(const BiometricState.initial(false, BiometricType.fingerprint)) {
    getBioType('');
  }
  final PinCodeUseCase useCase;
  final SharedPreferences prefs;

  bool isBegin = false;

  Future<void> getBioType(String pinCode) async {
    if (pinCode.isNotEmpty) {
      isBegin = true;
      emit(const BiometricState.initial(false, BiometricType.fingerprint));
    } else {
      final savedPin = prefs.getString(SharedKeys.pinCode) ?? '';
      if (savedPin.isEmpty) {
        emit(const BiometricState.initial(false, BiometricType.fingerprint));
      } else {
        final LocalAuthentication auth = LocalAuthentication();
        final bool isSupported = await auth.isDeviceSupported();
        if (!isSupported) {
          emit(const BiometricState.initial(false, BiometricType.fingerprint));
        } else {
          final List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();
          if (availableBiometrics.isEmpty) {
            emit(
                const BiometricState.initial(false, BiometricType.fingerprint));
          } else {
            BiometricType type = BiometricType.fingerprint;
            bool isSupported = true;
            if (availableBiometrics.contains(BiometricType.fingerprint)) {
              type = BiometricType.fingerprint;
            } else if (availableBiometrics.contains(BiometricType.strong)) {
              type = BiometricType.fingerprint;
            } else if (availableBiometrics.contains(BiometricType.face)) {
              type = BiometricType.face;
            } else {
              isSupported = false;
            }
            if (isSupported && !isBegin) {
              checkBio();
            }
            emit(BiometricState.initial(isSupported, type));
          }
        }
      }
    }
  }

  Future<void> checkBio() async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool didAuthenticate = await auth.authenticate(
      authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Tunduk',
          biometricHint: 'Используйте сканер отпечатка пальца для авторизации',
          cancelButton: 'Нет, спасибо',
        ),
        IOSAuthMessages(
          cancelButton: 'Нет, спасибо',
        ),
      ],
      localizedReason: 'Авторизуйтесь, чтобы продолжить',
      options: const AuthenticationOptions(
        biometricOnly: true,
      ),
    );
    final savedPin = prefs.getString(SharedKeys.pinCode) ?? '';
    if (didAuthenticate) {
      try {
        await useCase.enterPinCode(savedPin);
        AppRouting.pushAndPopUntilFunction(
          const BottomNavigatorRoute(),
        );
      } catch (e) {
        AppSnackBar.showSnackBar(e.toString());
      }
    }
  }
}
