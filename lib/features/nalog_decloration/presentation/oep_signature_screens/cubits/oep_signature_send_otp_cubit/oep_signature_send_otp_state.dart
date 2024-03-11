part of 'oep_signature_send_otp_cubit.dart';

@freezed
class OepSignatureSendOtpState with _$OepSignatureSendOtpState {
  const factory OepSignatureSendOtpState.initial() = _Initial;
  const factory OepSignatureSendOtpState.loadingEmail() = _LoadingEmail;
  const factory OepSignatureSendOtpState.loadingSms() = _LoadingSms;
  const factory OepSignatureSendOtpState.error() = _Error;
  const factory OepSignatureSendOtpState.success() = _Success;

  const OepSignatureSendOtpState._();
  bool get loadingEmail => maybeWhen(
        orElse: () => false,
        loadingEmail: () => true,
      );
  bool get loadingSms => maybeWhen(
        orElse: () => false,
        loadingSms: () => true,
      );
}
