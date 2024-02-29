part of 'get_kkm_detail_cubit.dart';

@freezed
class MegaKassaGetKkmDetailState with _$MegaKassaGetKkmDetailState {
  const factory MegaKassaGetKkmDetailState.loading() = _Loading;
  const factory MegaKassaGetKkmDetailState.error(String error) = _Error;
  const factory MegaKassaGetKkmDetailState.success({
    required MegaKassaKkmDetailEntity detail,
  }) = _Success;
}
