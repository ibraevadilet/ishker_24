part of 'get_kkm_list_cubit.dart';

@freezed
class MegaKassaGetKkmListState with _$MegaKassaGetKkmListState {
  const factory MegaKassaGetKkmListState.loading() = _Loading;
  const factory MegaKassaGetKkmListState.empty() = _Empty;
  const factory MegaKassaGetKkmListState.error(String error) = _Error;
  const factory MegaKassaGetKkmListState.success({
    required List<MegaKassaKkmEntity> kkms,
  }) = _Success;
}
