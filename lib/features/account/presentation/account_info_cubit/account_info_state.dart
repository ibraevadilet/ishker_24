part of 'account_info_cubit.dart';

@freezed
class AccountInfoState with _$AccountInfoState {
  const factory AccountInfoState.loading() = _Loading;
  const factory AccountInfoState.error(String error) = _Error;
  const factory AccountInfoState.success(AccountModel model) = _Success;
}
