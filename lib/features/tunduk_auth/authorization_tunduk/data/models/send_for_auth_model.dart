class SendForAuthModel {
  final String username;
  final String password;
  final String deviceId;
  final String deviceName;
  SendForAuthModel({
    required this.username,
    required this.password,
    required this.deviceId,
    required this.deviceName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'deviceId': deviceId,
      'deviceName': deviceName,
    };
  }
}
