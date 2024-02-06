class CheckHasIPModel {
  final String id;
  final String tin;
  final int status;
  final DateTime created;
  final String gnsStatus;
  String? declinedReason;
  final String passportNumber;
  String? qrUrl;

  CheckHasIPModel({
    required this.id,
    required this.tin,
    required this.status,
    required this.created,
    required this.gnsStatus,
    required this.declinedReason,
    required this.passportNumber,
    required this.qrUrl,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "tin": tin,
        "status": status,
        "created": created,
        "gnsStatus": gnsStatus,
        "declinedReason": declinedReason,
        "passportNumber": passportNumber,
        "qrUrl": qrUrl,
      };
}
