part of 'check_bank_cubit.dart';

@freezed
class CheckBankState with _$CheckBankState {
  const factory CheckBankState.loading() = _Loading;
  const factory CheckBankState.error(String error) = _Error;
  const factory CheckBankState.emptyBank() = _EmptyBank;
  const factory CheckBankState.success() = _Success;
}
