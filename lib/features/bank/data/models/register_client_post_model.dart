class RegisterClientPostModel {
  ///Client info
  final String pasportTypeAnId;
  final String pasportNumber;
  final String phoneNumber;
  final String emailAdress;
  final String vidDeatelnosty;

  //Ip info
  final String okpo;
  final String ogrn;
  final String seriesDocNumber;
  final String docNumber;
  final String docPlace;
  final String docDate;
  RegisterClientPostModel({
    required this.pasportTypeAnId,
    required this.pasportNumber,
    required this.phoneNumber,
    required this.emailAdress,
    required this.vidDeatelnosty,
    required this.okpo,
    required this.ogrn,
    required this.seriesDocNumber,
    required this.docNumber,
    required this.docPlace,
    required this.docDate,
  });

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'pasportTypeAnId': pasportTypeAnId,
  //     'pasportNumber': pasportNumber,
  //     'phoneNumber': phoneNumber,
  //     'emailAdress': emailAdress,
  //     'vidDeatelnosty': vidDeatelnosty,
  //     'okpo': okpo,
  //     'ogrn': ogrn,
  //     'seriesDocNumber': seriesDocNumber,
  //     'docNumber': docNumber,
  //     'docPlace': docPlace,
  //     'docDate': docDate,
  //   };
  // }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pin': '21605200001255',
      'email': 'ibraevadilet3@gmail.com',
      'mobilePhone': '+996554160500',
      'note372': 'Adilet my code word',
    };
  }
}
