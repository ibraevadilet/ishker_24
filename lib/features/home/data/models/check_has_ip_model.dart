// ignore_for_file: public_member_api_docs, sort_constructors_first

class CheckHasIPModel {
  final String gnsStatus;
  final String declinedReason;
  final String? tin;
  final String? image;

  CheckHasIPModel({
    required this.gnsStatus,
    required this.declinedReason,
    this.tin,
    this.image,
  });

  factory CheckHasIPModel.fromJson(Map<String, dynamic> map) {
    return CheckHasIPModel(
      gnsStatus: map['gnsStatus'],
      declinedReason: map['declinedReason'] ?? '',
      tin: map['tin'] ?? '',
      image: map['qrUrl'],
    );
  }
}
