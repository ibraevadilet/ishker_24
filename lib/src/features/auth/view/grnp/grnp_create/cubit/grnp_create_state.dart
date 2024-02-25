part of 'grnp_create_cubit.dart';

class GrnpCreateState extends Equatable {
  const GrnpCreateState({
    this.passSeries = '',
    this.passNumbers = '',
    this.pin = '',
    this.phone = '',
    this.status = const RequestInitial(),
  });

  final String passSeries;
  final String passNumbers;
  final String pin;
  final String phone;
  final RequestStatus status;

  GrnpCreateState copyWith({
    String? passSeries,
    String? passNumbers,
    String? pin,
    String? phone,
    RequestStatus? status,
  }) =>
      GrnpCreateState(
        passSeries: passSeries ?? this.passSeries,
        passNumbers: passNumbers ?? this.passNumbers,
        pin: pin ?? this.pin,
        phone: phone ?? this.phone,
        status: status ?? this.status,
      );

  bool get hasUserData =>
      passSeries.isNotEmpty &&
      passNumbers.isNotEmpty &&
      pin.isNotEmpty &&
      phone.isNotEmpty;

  @override
  List<Object?> get props => [
        passSeries,
        passNumbers,
        pin,
        phone,
        status,
      ];
}
