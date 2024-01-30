// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModel {
  final String requestId;
  final List<Body> body;
  final dynamic errors;
  final bool succeeded;
  final String twoFactorSessionToken;

  AuthModel({
    required this.requestId,
    required this.body,
    required this.errors,
    required this.succeeded,
    required this.twoFactorSessionToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        requestId: json["requestId"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
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
    List<Body>? body,
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
}

class Body {
  final String method;
  final bool enabled;
  final String? phoneNumberFragment;
  final String? emailFragment;

  Body({
    required this.method,
    required this.enabled,
    required this.phoneNumberFragment,
    required this.emailFragment,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
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

  Body copyWith({
    String? method,
    bool? enabled,
    String? phoneNumberFragment,
    String? emailFragment,
  }) {
    return Body(
      method: method ?? this.method,
      enabled: enabled ?? this.enabled,
      phoneNumberFragment: phoneNumberFragment ?? this.phoneNumberFragment,
      emailFragment: emailFragment ?? this.emailFragment,
    );
  }
}
