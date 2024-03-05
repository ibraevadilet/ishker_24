class GetUserInfoModel {
  final String inn;
  final String addressObl;
  final String addressStreet;
  final dynamic phoneNumber;
  final String fio;
  final String passportSeries;
  final String passportNumber;
  final DateTime issuedDate;
  final String passportAuthority;
  final double passportAuthorityCode;

  GetUserInfoModel({
    required this.inn,
    required this.addressObl,
    required this.addressStreet,
    required this.phoneNumber,
    required this.fio,
    required this.passportSeries,
    required this.passportNumber,
    required this.issuedDate,
    required this.passportAuthority,
    required this.passportAuthorityCode,
  });

  factory GetUserInfoModel.fromJson(Map<String, dynamic> json) =>
      GetUserInfoModel(
        inn: json["inn"] ?? '',
        addressObl: json["addressObl"] ?? '',
        addressStreet: json["addressStreet"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        fio: json["fio"] ?? '',
        passportSeries: json["passportSeries"] ?? '',
        passportNumber: json["passportNumber"] ?? '',
        issuedDate: DateTime.parse(json["issuedDate"]),
        passportAuthority: json["passportAuthority"] ?? '',
        passportAuthorityCode: json["passportAuthorityCode"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "inn": inn,
        "addressObl": addressObl,
        "addressStreet": addressStreet,
        "phoneNumber": phoneNumber,
        "fio": fio,
        "passportSeries": passportSeries,
        "passportNumber": passportNumber,
        "issuedDate": issuedDate.toIso8601String(),
        "passportAuthority": passportAuthority,
        "passportAuthorityCode": passportAuthorityCode,
      };
}
