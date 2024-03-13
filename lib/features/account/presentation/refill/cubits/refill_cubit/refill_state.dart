part of 'refill_cubit.dart';

sealed class RefillState extends Equatable {
  const RefillState();

  @override
  List<Object?> get props => [];
}

final class RefillInitial extends RefillState {}

final class RefillQrParsed extends RefillState {
  const RefillQrParsed({
    required this.sum,
    required this.currency,
    required this.account,
    required this.name,
  });

  final num sum;
  final String currency;
  final String account;
  final String name;

  @override
  List<Object?> get props => [sum, currency, account, name];
}

final class RefillLoading extends RefillState {}

final class RefillFailure extends RefillState {
  const RefillFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class RefillSuccess extends RefillState {
  const RefillSuccess();

  // final
}
