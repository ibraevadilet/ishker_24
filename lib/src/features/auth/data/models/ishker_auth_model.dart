import 'package:equatable/equatable.dart';

class IshkerAuthModel extends Equatable {
  final String type;
  final String accessToken;
  final String refreshToken;

  const IshkerAuthModel({
    required this.type,
    required this.accessToken,
    required this.refreshToken,
  });

  static const empty = IshkerAuthModel(
    type: '',
    accessToken: '',
    refreshToken: '',
  );

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
  }) =>
      IshkerAuthModel(
        type: type ?? this.type,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  @override
  List<Object?> get props => [type, accessToken, refreshToken];
}
