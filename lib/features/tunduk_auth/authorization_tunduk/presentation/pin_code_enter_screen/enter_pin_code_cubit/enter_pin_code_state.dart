part of 'enter_pin_code_cubit.dart';

@freezed
class EnterPinCodeState with _$EnterPinCodeState {
  const factory EnterPinCodeState.initial() = _Initial;
  const factory EnterPinCodeState.loading() = _Loading;
  const factory EnterPinCodeState.error(String error) = _Error;
  const factory EnterPinCodeState.success() = _Success;
  const factory EnterPinCodeState.isNotGrnp() = _isNotGrnp;
}
