part of 'biometric_cubit.dart';

@freezed
class BiometricState with _$BiometricState {
  const factory BiometricState.initial(
    bool isBioSupported,
    BiometricType type,
  ) = _Initial;
}
