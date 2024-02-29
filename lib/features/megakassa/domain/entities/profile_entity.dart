import 'dart:convert';

class MegaKassaProfileEntity {
  final ClientDetails? clientDetails;
  final double? balance;

  MegaKassaProfileEntity({
    required this.clientDetails,
    required this.balance,
  });

  MegaKassaProfileEntity copyWith({
    ClientDetails? clientDetails,
    double? balance,
  }) =>
      MegaKassaProfileEntity(
        clientDetails: clientDetails ?? this.clientDetails,
        balance: balance ?? this.balance,
      );

  factory MegaKassaProfileEntity.fromRawJson(String str) =>
      MegaKassaProfileEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MegaKassaProfileEntity.fromJson(Map<String, dynamic> json) =>
      MegaKassaProfileEntity(
        clientDetails: ClientDetails.fromJson(json["clientDetails"]),
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "clientDetails": clientDetails?.toJson(),
        "balance": balance,
      };
}

class ClientDetails {
  final String? type;
  final String? address;
  final String? fio;
  final String? phoneNum;
  final String? ls;
  final String? tin;
  final String? companyName;
  final String? okpo;
  final String? registrationCertificateNumber;
  final DateTime? contractStartDate;
  final String? checkingAccount;
  final String? bik;
  final String? login;
  final String? responsiblePerson;

  ClientDetails({
    required this.type,
    required this.address,
    required this.fio,
    required this.phoneNum,
    required this.ls,
    required this.tin,
    required this.companyName,
    required this.okpo,
    required this.registrationCertificateNumber,
    required this.contractStartDate,
    required this.checkingAccount,
    required this.bik,
    required this.login,
    required this.responsiblePerson,
  });

  ClientDetails copyWith({
    String? type,
    String? address,
    String? fio,
    String? phoneNum,
    String? ls,
    String? tin,
    String? companyName,
    String? okpo,
    String? registrationCertificateNumber,
    DateTime? contractStartDate,
    String? checkingAccount,
    String? bik,
    String? login,
    dynamic responsiblePerson,
  }) =>
      ClientDetails(
        type: type ?? this.type,
        address: address ?? this.address,
        fio: fio ?? this.fio,
        phoneNum: phoneNum ?? this.phoneNum,
        ls: ls ?? this.ls,
        tin: tin ?? this.tin,
        companyName: companyName ?? this.companyName,
        okpo: okpo ?? this.okpo,
        registrationCertificateNumber:
            registrationCertificateNumber ?? this.registrationCertificateNumber,
        contractStartDate: contractStartDate ?? this.contractStartDate,
        checkingAccount: checkingAccount ?? this.checkingAccount,
        bik: bik ?? this.bik,
        login: login ?? this.login,
        responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      );

  factory ClientDetails.fromRawJson(String str) =>
      ClientDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        type: json["type"],
        address: json["address"],
        fio: json["fio"],
        phoneNum: json["phoneNum"],
        ls: json["ls"],
        tin: json["tin"],
        companyName: json["companyName"],
        okpo: json["okpo"],
        registrationCertificateNumber: json["registrationCertificateNumber"],
        contractStartDate: DateTime.parse(json["contractStartDate"]),
        checkingAccount: json["checkingAccount"],
        bik: json["bik"],
        login: json["login"],
        responsiblePerson: json["responsiblePerson"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "address": address,
        "fio": fio,
        "phoneNum": phoneNum,
        "ls": ls,
        "tin": tin,
        "companyName": companyName,
        "okpo": okpo,
        "registrationCertificateNumber": registrationCertificateNumber,
        "contractStartDate": contractStartDate?.toIso8601String(),
        "checkingAccount": checkingAccount,
        "bik": bik,
        "login": login,
        "responsiblePerson": responsiblePerson,
      };
}
