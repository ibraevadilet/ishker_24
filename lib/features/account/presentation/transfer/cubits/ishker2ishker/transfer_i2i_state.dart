part of 'transfer_i2i_cubit.dart';

sealed class TransferI2IState extends Equatable {
  const TransferI2IState();

  @override
  List<Object?> get props => [];
}

final class I2IInitial extends TransferI2IState {}

final class I2IScanned extends TransferI2IState {
  const I2IScanned(this.qrData);

  final QrData qrData;

  @override
  List<Object?> get props => [qrData];
}

final class I2ILoading extends TransferI2IState {}

final class I2IFailure extends TransferI2IState {
  const I2IFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class I2IValidated extends TransferI2IState {
  const I2IValidated(this.entity, this.params);

  final TransferValidate entity;
  final TransferPerformI2IParams params;

  @override
  List<Object?> get props => [entity, params];
}

final class I2IPerformed extends TransferI2IState {
  const I2IPerformed(this.entity);

  final TransferPerform entity;

  @override
  List<Object?> get props => [entity];
}
