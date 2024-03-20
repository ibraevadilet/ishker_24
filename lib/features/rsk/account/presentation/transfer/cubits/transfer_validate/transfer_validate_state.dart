part of 'transfer_validate_cubit.dart';

sealed class TransferValidateState extends Equatable {
  const TransferValidateState();

  @override
  List<Object?> get props => [];
}

final class TrValidateInitial extends TransferValidateState {}

final class TrValidateLoading extends TransferValidateState {}

final class TrValidateFailure extends TransferValidateState {
  const TrValidateFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class TrValidateSuccess extends TransferValidateState {
  const TrValidateSuccess(this.entity, this.params);

  final TransferValidate entity;
  final TransferParams params;

  @override
  List<Object?> get props => [entity, params];
}
