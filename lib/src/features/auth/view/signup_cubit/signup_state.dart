part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.passSeries = '',
    this.passNumbers = '',
    this.pin = '',
    this.phone = '',
    this.email = '',
    this.status = const RequestInitial(),
  });

  final String passSeries;
  final String passNumbers;
  final String pin;
  final String phone;
  final String email;
  final RequestStatus status;

  SignUpState copyWith({
    String? passSeries,
    String? passNumbers,
    String? pin,
    String? phone,
    String? email,
    RequestStatus? status,
  }) =>
      SignUpState(
        passSeries: passSeries ?? this.passSeries,
        passNumbers: passNumbers ?? this.passNumbers,
        pin: pin ?? this.pin,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        status: status ?? this.status,
      );

  bool get hasUserData =>
      passSeries.isNotEmpty &&
      passNumbers.isNotEmpty &&
      pin.isNotEmpty &&
      phone.isNotEmpty &&
      email.isNotEmpty;

  @override
  List<Object?> get props => [
        passSeries,
        passNumbers,
        pin,
        phone,
        email,
        status,
      ];
}
