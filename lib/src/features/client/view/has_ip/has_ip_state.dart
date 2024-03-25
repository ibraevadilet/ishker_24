part of 'has_ip_cubit.dart';

sealed class HasIpState extends Equatable {
  const HasIpState();

  @override
  List<Object?> get props => [];
}

final class HasIpInitial extends HasIpState {}

final class HasIpLoading extends HasIpState {}

final class HasIpFailure extends HasIpState {
  const HasIpFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}

final class HasIpEmpty extends HasIpState {}

final class HasIpSuccess extends HasIpState {}

final class HasIpRefused extends HasIpState {
  const HasIpRefused(this.reason, this.created);

  final String reason;
  final DateTime? created;

  @override
  List<Object?> get props => [reason, created];
}

final class HasIpInProgress extends HasIpState {}

final class HasIpEmptyBank extends HasIpState {}
