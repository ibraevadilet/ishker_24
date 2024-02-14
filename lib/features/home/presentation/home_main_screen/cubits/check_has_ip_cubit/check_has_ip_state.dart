part of 'check_has_ip_cubit.dart';

@freezed
class CheckHasIpState with _$CheckHasIpState {
  const factory CheckHasIpState.loading() = _Loading;
  const factory CheckHasIpState.error(String error) = _Error;
  const factory CheckHasIpState.emptyIp() = _EmptyIp;
  const factory CheckHasIpState.emptyBank() = _EmptyBank;
  const factory CheckHasIpState.declinedIp(String reason, DateTime date) = _DeclinedIP;
  const factory CheckHasIpState.ipInProccess() = _ipInProcess;
  const factory CheckHasIpState.fullHas() = _FullHas;
}
