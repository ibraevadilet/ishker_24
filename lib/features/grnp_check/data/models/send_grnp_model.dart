class SendGRNPModel {
  final String pin;
  final String passportSeries;
  final String passportNumber;
  final String photo;
  SendGRNPModel({
    required this.pin,
    required this.passportSeries,
    required this.passportNumber,
    required this.photo,
  });

  Map<String, dynamic> toJson() => {
        "pin": pin,
        "series": passportSeries,
        "number": passportNumber,
        "imageBase64": photo,
      };
}
