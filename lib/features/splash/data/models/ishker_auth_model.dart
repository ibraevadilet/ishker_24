class IshkerAuthModel {
  final String type;
  final String accessToken;
  final String refreshToken;

  IshkerAuthModel({
    required this.type,
    required this.accessToken,
    required this.refreshToken,
  });

  factory IshkerAuthModel.fromJson(Map<String, dynamic> json) =>
      IshkerAuthModel(
        type: json["type"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };

  IshkerAuthModel copyWith({
    String? type,
    String? accessToken,
    String? refreshToken,
  }) {
    return IshkerAuthModel(
      type: type ?? this.type,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
