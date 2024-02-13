part of 'check_bank_cubit.dart';

@freezed
class CheckBankState with _$CheckBankState {
  const factory CheckBankState.loading() = _Loading;
  const factory CheckBankState.error(String error) = _Error;
  const factory CheckBankState.emptyBank() = _EmptyBank;
  const factory CheckBankState.success() = _Success;
  const factory CheckBankState.emptyIp() = _EmptyIp;
  const factory CheckBankState.declinedIp(String message) = _DeclinedIp;
  const factory CheckBankState.ipInProccess() = _IpInProccess;
}
