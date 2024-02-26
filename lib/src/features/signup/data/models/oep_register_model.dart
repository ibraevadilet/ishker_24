import 'package:equatable/equatable.dart';

class OepRegisterModel extends Equatable {
  const OepRegisterModel({
    required this.pin,
    required this.phone,
    required this.esiaAccepted,
    required this.passportSeries,
    required this.passportNumber,
    required this.email,
    required this.photo,
  });

  final String pin;
  final String phone;
  final bool esiaAccepted;
  final String passportSeries;
  final String passportNumber;
  final String email;
  final String photo;

  Map<String, dynamic> toJson() => {
        "pin": pin,
        "phone": phone,
        "esiaAccepted": esiaAccepted,
        "passportSeries": passportSeries,
        "passportNumber": passportNumber,
        "email": email,
        "photo": photo,
      };

  @override
  List<Object?> get props => [
        pin,
        phone,
        esiaAccepted,
        passportSeries,
        passportNumber,
        email,
        photo,
      ];
}
