import 'package:equatable/equatable.dart';

class SendConfirmCodeModel extends Equatable {
  const SendConfirmCodeModel({
    required this.pin,
    required this.deviceId,
    required this.verificationCode,
    required this.method,
    required this.twoFactorSessionToken,
  });

  final String pin;
  final String deviceId;
  final String verificationCode;
  final String method;
  final String twoFactorSessionToken;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pin': pin,
      'deviceId': deviceId,
      'verificationCode': verificationCode,
      'method': method.toUpperCase(),
      'twoFactorSessionToken': twoFactorSessionToken,
    };
  }

  @override
  List<Object?> get props => [
        pin,
        deviceId,
        verificationCode,
        method,
        twoFactorSessionToken,
      ];
}
