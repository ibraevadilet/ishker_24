class CheckOepModel {
  final bool emailType;
  final bool smsType;
  CheckOepModel({
    required this.emailType,
    required this.smsType,
  });

  factory CheckOepModel.fromJson(Map<String, dynamic> map) {
    return CheckOepModel(
      emailType: map['emailType'] ?? false,
      smsType: map['smsType'] ?? false,
    );
  }
}
