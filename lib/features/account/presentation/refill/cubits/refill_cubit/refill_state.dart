part of 'refill_cubit.dart';

class RefillState extends Equatable {
  const RefillState({
    required this.qrData,
    this.status = const RequestInitial(),
  });

  final RequestStatus status;
  final RefillInitialData qrData;

  RefillState copyWith({
    RefillInitialData? qrData,
    RequestStatus? status,
  }) =>
      RefillState(
        qrData: qrData ?? this.qrData,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [qrData, status];
}
