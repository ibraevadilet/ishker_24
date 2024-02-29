part of 'get_steps_info_cubit.dart';

@freezed
class GetStepsInfoState with _$GetStepsInfoState {
  const factory GetStepsInfoState.loading({
    required MegaKassaStepsInfoEntity? info,
  }) = _Loading;
  const factory GetStepsInfoState.initial({
    required MegaKassaStepsInfoEntity? info,
  }) = _Initial;
  const factory GetStepsInfoState.error({
    required String error,
    required MegaKassaStepsInfoEntity? info,
  }) = _Error;
  const factory GetStepsInfoState.success({
    required MegaKassaStepsInfoEntity? info,
  }) = _Success;
}

extension Loader on GetStepsInfoState {
  bool get isLoading => maybeWhen(
        loading: (_) => true,
        orElse: () => false,
      );
}
