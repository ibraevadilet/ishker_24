part of 'send_reset_pin_code_cubit.dart';

@freezed
class SendResetPinCodeState with _$SendResetPinCodeState {
  const factory SendResetPinCodeState.initial() = _Initial;
  const factory SendResetPinCodeState.loadingSms() = _LoadingSms;
  const factory SendResetPinCodeState.loadingEmail() = _LoadingEmail;
  const factory SendResetPinCodeState.error() = _Error;
  const factory SendResetPinCodeState.success() = _Success;

  const SendResetPinCodeState._();
  bool get loadingSms => maybeWhen(
        orElse: () => false,
        loadingSms: () => true,
      );
  bool get loadingEmail => maybeWhen(
        orElse: () => false,
        loadingEmail: () => true,
      );
}
