part of 'reset_pin_code_token_cubit.dart';

@freezed
class ResetPinCodeTokenState with _$ResetPinCodeTokenState {
  const factory ResetPinCodeTokenState.initial() = _Initial;
  const factory ResetPinCodeTokenState.loading() = _Loading;
  const factory ResetPinCodeTokenState.error() = _Error;
  const factory ResetPinCodeTokenState.success() = _Success;

  const ResetPinCodeTokenState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
