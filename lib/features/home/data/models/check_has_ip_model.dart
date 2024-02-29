// ignore_for_file: public_member_api_docs, sort_constructors_first

class CheckHasIPModel {
  final String gnsStatus;
  final String declinedReason;
  final String? tin;
  final String? image;
  final DateTime? created;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final bool isNewIp;

  CheckHasIPModel({
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

  factory CheckHasIPModel.fromJsonCertificate(Map<String, dynamic> map) {
    return CheckHasIPModel(
      gnsStatus: map['gnsStatus'],
      declinedReason: map['declinedReason'] ?? '',
      tin: map['tin'] ?? '',
      image: map['qrUrl'],
      created: DateTime.parse(map["created"]),
      isNewIp: true,
    );
  }
  factory CheckHasIPModel.fromJsonNoCertificate(Map<String, dynamic> map) {
    return CheckHasIPModel(
      gnsStatus: '',
      declinedReason: '',
      tin: map['tin'] ?? '',
      created: DateTime.tryParse(map["registrationDate"]),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      middleName: map['middleName'] ?? '',
    );
  }
}
