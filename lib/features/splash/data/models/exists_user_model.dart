class ExistsUserModel {
  final String persistentToken;
  final String pin;

  ExistsUserModel({
    required this.persistentToken,
    required this.pin,
  });

  factory ExistsUserModel.fromJson(Map<String, dynamic> json) =>
      ExistsUserModel(
        persistentToken: json["persistentToken"],
        pin: json["pin"],
      );
}
