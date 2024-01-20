part of 'confirm_otp_cubit.dart';

@freezed
class ConfirmOtpState with _$ConfirmOtpState {
  const factory ConfirmOtpState.initial() = _Initial;
  const factory ConfirmOtpState.loading() = _Loading;
  const factory ConfirmOtpState.error(String error) = _Error;
  const factory ConfirmOtpState.success() = _Success;

  const ConfirmOtpState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
