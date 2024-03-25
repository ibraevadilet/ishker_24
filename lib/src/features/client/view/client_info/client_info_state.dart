part of 'client_info_cubit.dart';

sealed class ClientInfoState extends Equatable {
  const ClientInfoState();

  @override
  List<Object?> get props => [];
}

final class ClientInfoInitial extends ClientInfoState {}

final class ClientInfoLoading extends ClientInfoState {}

final class ClientInfoSuccess extends ClientInfoState {
  const ClientInfoSuccess(this.info);

  final ClientInfo info;

  @override
  List<Object?> get props => [info];
}

// final class ClientInfoEmpty extends ClientInfoState {
//   const ClientInfoEmpty(this.partyId);

//   final String partyId;

//   @override
//   List<Object?> get props => [partyId];
// }

final class ClientInfoFailure extends ClientInfoState {
  const ClientInfoFailure(this.e);

  final Exception e;

  @override
  List<Object?> get props => [e];
}
