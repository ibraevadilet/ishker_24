part of 'account_info_cubit.dart';

sealed class AccountInfoState extends Equatable {
  const AccountInfoState();

  @override
  List<Object?> get props => [];
}

final class AccountInfoInitial extends AccountInfoState {}

final class AccountInfoLoading extends AccountInfoState {}

final class AccountInfoFailure extends AccountInfoState {
  const AccountInfoFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class AccountInfoSuccess extends AccountInfoState {
  const AccountInfoSuccess(this.account);

  final Account account;

  @override
  List<Object?> get props => [account];
}
