class RegisterClientPostModel {
  final String pin;
  final String phoneNumber;
  final String emailAdress;
  final String vidDeatelnosti;
  final String comment;
  //1 - photo, 2 - all, 3 - video
  final int identificationType;

  RegisterClientPostModel({
    required this.pin,
    required this.phoneNumber,
    required this.emailAdress,
    required this.vidDeatelnosti,
    required this.comment,
    this.identificationType = 3,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pin': pin,
      'email': emailAdress,
      'mobilePhone': phoneNumber,
      'note226': vidDeatelnosti,
      'note372': comment,
      'identificationType': identificationType,
    };
  }

  @override
  String toString() {
    return 'pin: $emailAdress, mobilePhone: $phoneNumber, comment: $comment';
  }
}
