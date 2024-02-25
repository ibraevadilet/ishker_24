part of 'grnp_cubit.dart';

sealed class GrnpState extends Equatable {
  const GrnpState();

  @override
  List<Object?> get props => [];
}

final class GrnpInitial extends GrnpState {}

final class GrnpLoading extends GrnpState {}

final class GrnpFailure extends GrnpState {
  const GrnpFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class GrnpSuccess extends GrnpState {}
