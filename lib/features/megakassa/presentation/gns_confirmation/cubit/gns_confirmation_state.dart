part of 'gns_confirmation_cubit.dart';

@freezed
class GnsConfirmationState with _$GnsConfirmationState {
  const factory GnsConfirmationState.loading({
    required String method,
  }) = _Loading;
  const factory GnsConfirmationState.initial() = _Initial;
  const factory GnsConfirmationState.error(String error) = _Error;
  const factory GnsConfirmationState.success({required String method}) =
      _Success;
}

extension Loader on GnsConfirmationState {
  bool get isLoadingSms => maybeWhen(
        loading: (method) => method == 'sms',
        orElse: () => false,
      );
  bool get isLoadingEmail => maybeWhen(
        loading: (method) => method == 'email',
        orElse: () => false,
      );
}
