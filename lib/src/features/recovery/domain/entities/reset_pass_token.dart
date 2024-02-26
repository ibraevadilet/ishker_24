import 'package:equatable/equatable.dart';

class ResetPasswordToken extends Equatable {
  const ResetPasswordToken(this.userId, this.token);

  final String userId;
  final String token;

  @override
  List<Object?> get props => [userId, token];
}
