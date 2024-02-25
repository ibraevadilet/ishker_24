import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends Equatable {
  final String requestId;
  final List<BodyModel> body;
  final dynamic errors;
  final bool succeeded;
  final String twoFactorSessionToken;

  const AuthModel({
    required this.requestId,
    required this.body,
    required this.errors,
    required this.succeeded,
    required this.twoFactorSessionToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        requestId: json["requestId"],
        body: List<BodyModel>.from(
            json["body"].map((x) => BodyModel.fromJson(x))),
        errors: json["errors"],
        succeeded: json["succeeded"],
        twoFactorSessionToken: json["twoFactorSessionToken"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "errors": errors,
        "succeeded": succeeded,
        "twoFactorSessionToken": twoFactorSessionToken,
      };

  AuthModel copyWith({
    String? requestId,
    List<BodyModel>? body,
    dynamic errors,
    bool? succeeded,
    String? twoFactorSessionToken,
  }) {
    return AuthModel(
      requestId: requestId ?? this.requestId,
      body: body ?? this.body,
      errors: errors ?? this.errors,
      succeeded: succeeded ?? this.succeeded,
      twoFactorSessionToken:
          twoFactorSessionToken ?? this.twoFactorSessionToken,
    );
  }

  AuthEntity toEntity() => AuthEntity(
        requestId: requestId,
        body: body.map((e) => e.toEntity()).toList(),
        errors: errors,
        succeeded: succeeded,
        twoFactorSessionToken: twoFactorSessionToken,
      );

  @override
  List<Object?> get props => [
        requestId,
        body,
        errors,
        succeeded,
        twoFactorSessionToken,
      ];
}

class BodyModel extends Equatable {
  final String method;
  final bool enabled;
  final String? phoneNumberFragment;
  final String? emailFragment;

  const BodyModel({
    required this.method,
    required this.enabled,
    required this.phoneNumberFragment,
    required this.emailFragment,
  });

  factory BodyModel.fromJson(Map<String, dynamic> json) => BodyModel(
        method: json["method"],
        enabled: json["enabled"],
        phoneNumberFragment: json["phoneNumberFragment"],
        emailFragment: json["emailFragment"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "enabled": enabled,
        "phoneNumberFragment": phoneNumberFragment,
        "emailFragment": emailFragment,
      };

  BodyModel copyWith({
    String? method,
    bool? enabled,
    String? phoneNumberFragment,
    String? emailFragment,
  }) {
    return BodyModel(
      method: method ?? this.method,
      enabled: enabled ?? this.enabled,
      phoneNumberFragment: phoneNumberFragment ?? this.phoneNumberFragment,
      emailFragment: emailFragment ?? this.emailFragment,
    );
  }

  BodyEntity toEntity() => BodyEntity(
        method: method,
        enabled: enabled,
        phoneNumberFragment: phoneNumberFragment,
        emailFragment: emailFragment,
      );

  @override
  List<Object?> get props => [
        method,
        enabled,
        phoneNumberFragment,
        emailFragment,
      ];
}
