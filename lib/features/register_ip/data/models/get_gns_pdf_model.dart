class GetGnsPdfModel {
  final String inn;
  final String phone;
  final String email;
  final String realLocationObl;
  final String realLocationAddress;
  GetGnsPdfModel({
    required this.inn,
    required this.phone,
    required this.email,
    required this.realLocationObl,
    required this.realLocationAddress,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'inn': inn,
      'phone': phone,
      'email': email,
      'realLocationObl': realLocationObl,
      'realLocationAddress': realLocationAddress,
    };
  }
}
