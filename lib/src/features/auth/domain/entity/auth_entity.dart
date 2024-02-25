import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.requestId,
    required this.body,
    required this.errors,
    required this.succeeded,
    required this.twoFactorSessionToken,
  });

  static const empty = AuthEntity(
    requestId: '',
    body: <BodyEntity>[],
    errors: '',
    succeeded: false,
    twoFactorSessionToken: '',
  );

  final String requestId;
  final List<BodyEntity> body;
  final dynamic errors;
  final bool succeeded;
  final String twoFactorSessionToken;

  AuthEntity copyWith({
    String? requestId,
    List<BodyEntity>? body,
    dynamic errors,
    bool? succeeded,
    String? twoFactorSessionToken,
  }) =>
      AuthEntity(
        requestId: requestId ?? this.requestId,
        body: body ?? this.body,
        errors: errors ?? this.errors,
        succeeded: succeeded ?? this.succeeded,
        twoFactorSessionToken:
            twoFactorSessionToken ?? this.twoFactorSessionToken,
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

class BodyEntity extends Equatable {
  final String method;
  final bool enabled;
  final String? phoneNumberFragment;
  final String? emailFragment;

  const BodyEntity({
    required this.method,
    required this.enabled,
    required this.phoneNumberFragment,
    required this.emailFragment,
  });

  static const empty = BodyEntity(
    method: '',
    enabled: false,
    phoneNumberFragment: '',
    emailFragment: '',
  );

  BodyEntity copyWith({
    String? method,
    bool? enabled,
    String? phoneNumberFragment,
    String? emailFragment,
  }) {
    return BodyEntity(
      method: method ?? this.method,
      enabled: enabled ?? this.enabled,
      phoneNumberFragment: phoneNumberFragment ?? this.phoneNumberFragment,
      emailFragment: emailFragment ?? this.emailFragment,
    );
  }

  @override
  List<Object?> get props => [
        method,
        enabled,
        phoneNumberFragment,
        emailFragment,
      ];
}
