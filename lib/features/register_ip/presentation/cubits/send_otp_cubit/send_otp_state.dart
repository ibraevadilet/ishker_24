part of 'send_otp_cubit.dart';

@freezed
class SendOtpState with _$SendOtpState {
  const factory SendOtpState.initial() = _Initial;
  const factory SendOtpState.smsLoading() = _SmsLoading;
  const factory SendOtpState.emailLoading() = _EmailLoading;
  const factory SendOtpState.error(String error) = _Error;
  const factory SendOtpState.success() = _Success;

  const SendOtpState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        smsLoading: () => true,
        emailLoading: () => true,
      );
  bool get emailLoading => maybeWhen(
        orElse: () => false,
        emailLoading: () => true,
      );
  bool get smsLoading => maybeWhen(
        orElse: () => false,
        smsLoading: () => true,
      );
}
