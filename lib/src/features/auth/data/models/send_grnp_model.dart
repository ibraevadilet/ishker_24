import 'package:equatable/equatable.dart';

class SendGRNPModel extends Equatable {
  const SendGRNPModel({
    required this.pin,
    required this.passportSeries,
    required this.passportNumber,
    required this.photo,
  });

  final String pin;
  final String passportSeries;
  final String passportNumber;
  final String photo;

  Map<String, dynamic> toJson() => {
        "pin": pin,
        "series": passportSeries,
        "number": passportNumber,
        "imageBase64": photo,
      };

  @override
  List<Object?> get props => [pin, passportSeries, passportNumber, photo];
}
