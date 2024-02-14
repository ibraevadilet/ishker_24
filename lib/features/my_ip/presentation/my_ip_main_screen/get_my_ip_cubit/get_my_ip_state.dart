part of 'get_my_ip_cubit.dart';

@freezed
class GetMyIpState with _$GetMyIpState {
  const factory GetMyIpState.loading() = _Loading;
  const factory GetMyIpState.emptyIp() = _EmptyIp;
  const factory GetMyIpState.declinedIp(String message, DateTime date) = _DeclinedIp;
  const factory GetMyIpState.inProccess() = _InProccess;
  const factory GetMyIpState.success(CheckHasIPModel model) = _Success;
  const factory GetMyIpState.error(String error) = _Error;
}
