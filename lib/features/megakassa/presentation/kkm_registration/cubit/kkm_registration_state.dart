part of 'kkm_registration_cubit.dart';

@freezed
class KkmRegistrationState with _$KkmRegistrationState {
  const factory KkmRegistrationState.loading() = _Loading;
  const factory KkmRegistrationState.initial() = _Initial;
  const factory KkmRegistrationState.error(String error) = _Error;
  const factory KkmRegistrationState.success({
    required MegaKassaKkmEntity entity,
  }) = _Success;
}

extension Loader on KkmRegistrationState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
