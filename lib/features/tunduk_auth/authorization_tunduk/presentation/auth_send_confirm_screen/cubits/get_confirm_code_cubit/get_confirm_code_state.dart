part of 'get_confirm_code_cubit.dart';

@freezed
class GetConfirmCodeState with _$GetConfirmCodeState {
  const factory GetConfirmCodeState.initial() = _Initial;
  const factory GetConfirmCodeState.loadingTelegrem() = _LoadingTelegrem;
  const factory GetConfirmCodeState.loadingEmail() = _LoadingEmail;
  const factory GetConfirmCodeState.loadingSms() = _LoadingSms;
  const factory GetConfirmCodeState.error(String error) = _Error;

  const GetConfirmCodeState._();
  bool get loadingTelegram => maybeWhen(
        orElse: () => false,
        loadingTelegrem: () => true,
      );
  bool get loadingEmail => maybeWhen(
        orElse: () => false,
        loadingEmail: () => true,
      );
  bool get loadingSms => maybeWhen(
        orElse: () => false,
        loadingSms: () => true,
      );
}
