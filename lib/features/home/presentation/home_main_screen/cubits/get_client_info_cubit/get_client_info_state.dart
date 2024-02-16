part of 'get_client_info_cubit.dart';

@freezed
class GetClientInfoState with _$GetClientInfoState {
  const factory GetClientInfoState.loading() = _Loading;
  const factory GetClientInfoState.error(String error) = _Error;
  const factory GetClientInfoState.success(ClientInfoModel model) = _Success;
  const factory GetClientInfoState.emptyAccount(String partyId) = _EmptyAccount;
}
