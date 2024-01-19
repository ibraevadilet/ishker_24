part of 'register_oep_cubit.dart';

@freezed
class RegisterOepState with _$RegisterOepState {
  const factory RegisterOepState.initial() = _Initial;
  const factory RegisterOepState.loading() = _Loading;
  const factory RegisterOepState.error(String error) = _Error;
  const factory RegisterOepState.success() = _Success;

  const RegisterOepState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
