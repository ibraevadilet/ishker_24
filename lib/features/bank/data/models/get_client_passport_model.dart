class ClientPassportModel {
  final String idDocSeries;
  final String idDocNumber;
  ClientPassportModel({
    required this.idDocSeries,
    required this.idDocNumber,
  });

  factory ClientPassportModel.fromMap(Map<String, dynamic> map) {
    return ClientPassportModel(
      idDocSeries: map['idDocSeries'],
      idDocNumber: map['idDocNumber'],
    );
  }
}
