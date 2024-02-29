part of 'get_megakassa_status_cubit.dart';

@freezed
class GetMegaKassaStatusState with _$GetMegaKassaStatusState {
  const factory GetMegaKassaStatusState.loading() = _Loading;
  const factory GetMegaKassaStatusState.error(String error) = _Error;
  const factory GetMegaKassaStatusState.registered() = _Registered;
  const factory GetMegaKassaStatusState.unregistered() = _Unregistered;
}
