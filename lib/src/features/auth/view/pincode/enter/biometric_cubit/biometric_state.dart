part of 'biometric_cubit.dart';

// @freezed
// class BiometricState with _$BiometricState {
//   const factory BiometricState.initial(
//     bool isBioSupported,
//     BiometricType type,
//   ) = _Initial;
// }

sealed class BiometricState extends Equatable {
  const BiometricState({
    this.isSupported = false,
    this.type = BiometricType.fingerprint,
  });

  final bool isSupported;
  final BiometricType type;

  @override
  List<Object?> get props => [];
}

final class BiometricInitial extends BiometricState {}

final class BiometricSupported extends BiometricState {
  const BiometricSupported({super.isSupported, super.type});
}
