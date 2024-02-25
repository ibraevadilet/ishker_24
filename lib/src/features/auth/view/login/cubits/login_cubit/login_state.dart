part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  const LoginFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class LoginSuccess extends LoginState {
  const LoginSuccess(this.entity);

  final AuthEntity entity;

  @override
  List<Object?> get props => [entity];
}
