part of 'set_pin_code_cubit.dart';

@freezed
class SetPinCodeState with _$SetPinCodeState {
  const factory SetPinCodeState.initial() = _Initial;
  const factory SetPinCodeState.loading() = _Loading;
  const factory SetPinCodeState.error(String error) = _Error;
  const factory SetPinCodeState.success() = _Success;
}
