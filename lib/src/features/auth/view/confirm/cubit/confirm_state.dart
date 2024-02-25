part of 'confirm_cubit.dart';

sealed class ConfirmState extends Equatable {
  const ConfirmState({this.method = ''});

  final String method;

  @override
  List<Object?> get props => [method];
}

final class ConfirmInitial extends ConfirmState {}

final class ConfirmSended extends ConfirmState {
  const ConfirmSended(this.token, {super.method});

  final String token;

  @override
  List<Object?> get props => [token];
}

final class ConfirmFailure extends ConfirmState {
  const ConfirmFailure(this.exception, {super.method});

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class ConfirmSending extends ConfirmState {
  const ConfirmSending({required super.method});
}

// final class ConfirmSmsLoading extends ConfirmState {}

// final class ConfirmEmailLoading extends ConfirmState {}

// final class ConfirmTelegramLoading extends ConfirmState {}

final class ConfirmConfirming extends ConfirmState {
  const ConfirmConfirming({super.method});
}

final class ConfirmConfirmed extends ConfirmState {
  const ConfirmConfirmed(this.entity, {super.method});

  final ConfirmCodeEntity entity;

  @override
  List<Object?> get props => [entity];
}
