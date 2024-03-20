import 'package:equatable/equatable.dart';
import 'package:ishker_24/features/rsk/client/domain/entities/has_ip.dart';

class HasIPModel extends Equatable {
  const HasIPModel({
    required this.gnsStatus,
    required this.declinedReason,
    this.tin,
    this.image,
    this.created,
    this.firstName,
    this.lastName,
    this.middleName,
    this.isNewIp = false,
  });

  final String gnsStatus;
  final String declinedReason;
  final String? tin;
  final String? image;
  final DateTime? created;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final bool isNewIp;

  factory HasIPModel.fromJsonCertificate(Map<String, dynamic> map) {
    return HasIPModel(
      gnsStatus: map['gnsStatus'],
      declinedReason: map['declinedReason'] ?? '',
      tin: map['tin'] ?? '',
      image: map['qrUrl'],
      created: DateTime.parse(map["created"]),
      isNewIp: true,
    );
  }

  factory HasIPModel.fromJsonNoCertificate(Map<String, dynamic> map) {
    return HasIPModel(
      gnsStatus: '',
      declinedReason: '',
      tin: map['tin'] ?? '',
      created: DateTime.tryParse(map["registrationDate"]),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      middleName: map['middleName'] ?? '',
    );
  }

  HasIP get toEntity => HasIP(
        gnsStatus: gnsStatus,
        declinedReason: declinedReason,
        tin: tin,
        image: image,
        created: created,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        isNewIp: isNewIp,
      );

  @override
  List<Object?> get props => [
        gnsStatus,
        declinedReason,
        tin,
        image,
        created,
        firstName,
        lastName,
        middleName,
        isNewIp,
      ];
}
