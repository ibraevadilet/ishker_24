class RegisterClientPostModel {
  final String pin;
  final String phoneNumber;
  final String emailAdress;
  final String vidDeatelnosti;
  final String comment;
  RegisterClientPostModel({
    required this.pin,
    required this.phoneNumber,
    required this.emailAdress,
    required this.vidDeatelnosti,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pin': pin,
      'email': emailAdress,
      'mobilePhone': phoneNumber,
      'note226': vidDeatelnosti,
      'note372': comment,
    };
  }

  @override
  String toString() {
    return 'pin: $emailAdress, mobilePhone: $phoneNumber, comment: $comment';
  }
}
