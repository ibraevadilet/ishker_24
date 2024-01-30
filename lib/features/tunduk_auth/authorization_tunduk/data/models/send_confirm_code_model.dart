class SendConfirmCodeModel {
  final String inn;
  final String deviceId;
  final String verificationCode;
  final String method;
  final String twoFactorSessionToken;
  SendConfirmCodeModel({
    required this.inn,
    required this.deviceId,
    required this.verificationCode,
    required this.method,
    required this.twoFactorSessionToken,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pin': inn,
      'deviceId': deviceId,
      'verificationCode': verificationCode,
      'method': method.toUpperCase(),
      'twoFactorSessionToken': twoFactorSessionToken,
    };
  }
}
