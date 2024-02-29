import 'dart:convert';

import 'package:flutter/foundation.dart';

class MegaKassaGnsRegistrationRequestEntity {
  final String okpo;
  final String bik;
  final String checkingAccount;
  final String registrationCertificateNumber;
  final String address;
  final String msisdn;
  final String password;
  final String login;
  final Map<String, dynamic>? clientGnsRegistrationRequest;

  MegaKassaGnsRegistrationRequestEntity({
    required this.okpo,
    required this.bik,
    required this.checkingAccount,
    required this.registrationCertificateNumber,
    required this.address,
    required this.msisdn,
    required this.password,
    required this.login,
    this.clientGnsRegistrationRequest,
  });

  MegaKassaGnsRegistrationRequestEntity copyWith({
    String? okpo,
    String? bik,
    String? checkingAccount,
    String? registrationCertificateNumber,
    String? address,
    String? msisdn,
    String? password,
    String? login,
    Map<String, dynamic>? clientGnsRegistrationRequest,
  }) {
    return MegaKassaGnsRegistrationRequestEntity(
      okpo: okpo ?? this.okpo,
      bik: bik ?? this.bik,
      checkingAccount: checkingAccount ?? this.checkingAccount,
      registrationCertificateNumber:
          registrationCertificateNumber ?? this.registrationCertificateNumber,
      address: address ?? this.address,
      msisdn: msisdn ?? this.msisdn,
      password: password ?? this.password,
      login: login ?? this.login,
      clientGnsRegistrationRequest:
          clientGnsRegistrationRequest ?? this.clientGnsRegistrationRequest,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'okpo': okpo});
    result.addAll({'bik': bik});
    result.addAll({'checkingAccount': checkingAccount});
    result.addAll(
        {'registrationCertificateNumber': registrationCertificateNumber});
    result.addAll({'address': address});
    result.addAll({'msisdn': msisdn});
    if (clientGnsRegistrationRequest != null) {
      result.addAll(
          {'clientGnsRegistrationRequest': clientGnsRegistrationRequest});
    }

    return result;
  }

  factory MegaKassaGnsRegistrationRequestEntity.fromMap(
      Map<String, dynamic> map) {
    return MegaKassaGnsRegistrationRequestEntity(
      okpo: map['okpo'] ?? '',
      bik: map['bik'] ?? '',
      checkingAccount: map['checkingAccount'] ?? '',
      registrationCertificateNumber: map['registrationCertificateNumber'] ?? '',
      address: map['address'] ?? '',
      msisdn: map['msisdn'] ?? '',
      password: map['password'] ?? '',
      login: map['login'] ?? '',
      clientGnsRegistrationRequest:
          Map<String, dynamic>.from(map['clientGnsRegistrationRequest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MegaKassaGnsRegistrationRequestEntity.fromJson(String source) =>
      MegaKassaGnsRegistrationRequestEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MegaKassaGnsRegistrationRequestEntity(okpo: $okpo, bik: $bik, checkingAccount: $checkingAccount, registrationCertificateNumber: $registrationCertificateNumber, address: $address, msisdn: $msisdn, password: $password, login: $login, clientGnsRegistrationRequest: $clientGnsRegistrationRequest)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaGnsRegistrationRequestEntity &&
        other.okpo == okpo &&
        other.bik == bik &&
        other.checkingAccount == checkingAccount &&
        other.registrationCertificateNumber == registrationCertificateNumber &&
        other.address == address &&
        other.msisdn == msisdn &&
        other.password == password &&
        other.login == login &&
        mapEquals(
            other.clientGnsRegistrationRequest, clientGnsRegistrationRequest);
  }

  @override
  int get hashCode {
    return okpo.hashCode ^
        bik.hashCode ^
        checkingAccount.hashCode ^
        registrationCertificateNumber.hashCode ^
        address.hashCode ^
        msisdn.hashCode ^
        password.hashCode ^
        login.hashCode ^
        clientGnsRegistrationRequest.hashCode;
  }
}
