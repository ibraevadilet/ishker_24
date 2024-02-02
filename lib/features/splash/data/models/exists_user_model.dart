class ExistsUserModel {
  final String persistentSessionToken;
  final String pin;

  ExistsUserModel({
    required this.persistentSessionToken,
    required this.pin,
  });

  factory ExistsUserModel.fromJson(Map<String, dynamic> json) =>
      ExistsUserModel(
        persistentSessionToken: json["persistentSessionToken"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "persistentSessionToken": persistentSessionToken,
        "pin": pin,
      };

  ExistsUserModel copyWith({
    String? persistentSessionToken,
    String? pin,
  }) {
    return ExistsUserModel(
      persistentSessionToken:
          persistentSessionToken ?? this.persistentSessionToken,
      pin: pin ?? this.pin,
    );
  }
}
