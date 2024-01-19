import 'package:dio/dio.dart';

class SendRegisterOEPModel {
  final String pin;
  final String phone;
  final bool esiaAccepted;
  final String passportSeries;
  final String passportNumber;
  final String email;
  final String photo;
  SendRegisterOEPModel({
    required this.pin,
    required this.phone,
    required this.esiaAccepted,
    required this.passportSeries,
    required this.passportNumber,
    required this.email,
    required this.photo,
  });

  FormData toJson() {
    FormData formData = FormData.fromMap({
      "pin": pin,
      "phone": phone,
      "esiaAccepted": esiaAccepted,
      "passportSeries": passportSeries,
      "passportNumber": passportNumber,
      "email": email,
    });

    formData.files.add(
      MapEntry(
        "photo",
        MultipartFile.fromFileSync(
          photo,
          filename: "photo.jpg",
        ),
      ),
    );

    return formData;
  }
}
