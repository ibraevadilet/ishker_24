class PinCodeTypesModel {
  final String authType;
  final dynamic created;

  PinCodeTypesModel({
    required this.authType,
    required this.created,
  });

  factory PinCodeTypesModel.fromJson(Map<String, dynamic> json) =>
      PinCodeTypesModel(
        authType: json["authType"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "authType": authType,
        "created": created,
      };
}
