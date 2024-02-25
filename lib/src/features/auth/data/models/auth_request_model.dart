import 'package:equatable/equatable.dart';

class AuthRequestBody extends Equatable {
  const AuthRequestBody({
    required this.username,
    required this.password,
    required this.deviceId,
    required this.deviceName,
  });

  final String username;
  final String password;
  final String deviceId;
  final String deviceName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'deviceId': deviceId,
      'deviceName': deviceName,
    };
  }

  @override
  List<Object?> get props => [username, password, deviceId, deviceName];
}
