part of 'gns_registration_cubit.dart';

@freezed
class GnsRegistrationState with _$GnsRegistrationState {
  const factory GnsRegistrationState.loading() = _Loading;
  const factory GnsRegistrationState.initial() = _Initial;
  const factory GnsRegistrationState.error(String error) = _Error;
  const factory GnsRegistrationState.success({
    required List<PinCodeTypesModel> methods,
    MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    MegaKassaKkmRegistrationEntity? kkmRegistrationEntity,
    MegaKassaKkmEntity? kkmEntity,
  }) = _Success;
}

extension Loader on GnsRegistrationState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
