class ClientInfoModel {
  final String absId;
  final String idDocSeries;
  final String idDocNumber;
  final String email;
  final String mobilePhone;
  final String pin;
  final String regDocSeries;
  final String regDocNumber;
  final String regDocPlace;
  final String regDocDate;

  ClientInfoModel({
    required this.absId,
    required this.idDocSeries,
    required this.idDocNumber,
    required this.email,
    required this.mobilePhone,
    required this.pin,
    required this.regDocSeries,
    required this.regDocNumber,
    required this.regDocPlace,
    required this.regDocDate,
  });

  factory ClientInfoModel.fromJson(Map<String, dynamic> json) =>
      ClientInfoModel(
        absId: json["absId"],
        idDocSeries: json["idDocSeries"],
        idDocNumber: json["idDocNumber"],
        email: json["email"],
        mobilePhone: json["mobilePhone"],
        pin: json["pin"],
        regDocSeries: json["regDocSeries"],
        regDocNumber: json["regDocNumber"],
        regDocPlace: json["regDocPlace"],
        regDocDate: json["regDocDate"],
      );

  Map<String, dynamic> toJson() => {
        "absId": absId,
        "idDocSeries": idDocSeries,
        "idDocNumber": idDocNumber,
        "email": email,
        "mobilePhone": mobilePhone,
        "pin": pin,
        "regDocSeries": regDocSeries,
        "regDocNumber": regDocNumber,
        "regDocPlace": regDocPlace,
        "regDocDate": regDocDate,
      };
}
