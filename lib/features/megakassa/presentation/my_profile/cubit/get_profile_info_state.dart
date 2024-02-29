part of 'get_profile_info_cubit.dart';

@freezed
class GetProfileInfoState with _$GetProfileInfoState {
  const factory GetProfileInfoState.loading() = _Loading;
  const factory GetProfileInfoState.initial() = _Initial;
  const factory GetProfileInfoState.error(String error) = _Error;
  const factory GetProfileInfoState.success({
    required MegaKassaProfileEntity profile,
  }) = _Success;
}

extension Loader on GetProfileInfoState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
