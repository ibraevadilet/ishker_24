import 'package:equatable/equatable.dart';

sealed class RequestStatus extends Equatable {
  const RequestStatus();

  @override
  List<Object?> get props => [];
}

final class RequestInitial extends RequestStatus {
  const RequestInitial();
}

final class RequestLoading extends RequestStatus {}

final class RequestSuccess extends RequestStatus {}

final class RequestFailure extends RequestStatus {
  const RequestFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
