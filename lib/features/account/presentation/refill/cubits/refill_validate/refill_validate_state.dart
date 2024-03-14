part of 'refill_validate_cubit.dart';

sealed class RefillValidateState extends Equatable {
  const RefillValidateState();

  @override
  List<Object?> get props => [];
}

final class RefillValidateInitial extends RefillValidateState {}

final class RefillValidateLoading extends RefillValidateState {}

final class RefillValidateFailure extends RefillValidateState {
  const RefillValidateFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class RefillValidateSuccess extends RefillValidateState {
  const RefillValidateSuccess(this.entity, this.params);

  final TransferValidate entity;
  final TransferPerformI2IParams params;

  @override
  List<Object?> get props => [entity, params];
}
