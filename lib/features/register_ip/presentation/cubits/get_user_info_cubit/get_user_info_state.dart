part of 'get_user_info_cubit.dart';

@freezed
class GetUserInfoState with _$GetUserInfoState {
  const factory GetUserInfoState.loading() = _Loading;
  const factory GetUserInfoState.error(String error) = _Error;
  const factory GetUserInfoState.success() = _Success;
}
