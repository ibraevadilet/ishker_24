part of 'pincode_enter_cubit.dart';

sealed class PinCodeEnterState extends Equatable {
  const PinCodeEnterState();

  @override
  List<Object?> get props => [];
}

final class PinCodeEnterInitial extends PinCodeEnterState {}

final class PinCodeEnterLoading extends PinCodeEnterState {}

final class PinCodeEnterFailure extends PinCodeEnterState {
  const PinCodeEnterFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class PinCodeEnterSuccess extends PinCodeEnterState {}
