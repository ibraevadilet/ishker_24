part of 'transfer_cubit.dart';

sealed class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object?> get props => [];
}

final class TransferInitial extends TransferState {}

final class TransferLoading extends TransferState {}

final class TransferFailure extends TransferState {
  const TransferFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class TransferSuccess extends TransferState {
  const TransferSuccess(this.entity);

  final TransferPerform entity;

  @override
  List<Object?> get props => [entity];
}
