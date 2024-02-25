part of 'pincode_create_cubit.dart';

class PinCodeCreateState extends Equatable {
  const PinCodeCreateState({
    this.first = '',
    this.second = '',
    this.status = const RequestInitial(),
  });

  final String first;
  final String second;
  final RequestStatus status;

  PinCodeCreateState copyWith({
    String? first,
    String? second,
    RequestStatus? status,
  }) =>
      PinCodeCreateState(
        first: first ?? this.first,
        second: second ?? this.second,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [first, second, status];
}
