import 'package:equatable/equatable.dart';
import 'package:ishker_24/src/features/auth/recovery/domain/entities/reset_pass_token.dart';

class ResetPasswordTokenModel extends Equatable {
  const ResetPasswordTokenModel(this.userId, this.token);

  final String userId;
  final String token;

  factory ResetPasswordTokenModel.fromJson(Map<String, dynamic> map) =>
      ResetPasswordTokenModel(map['userId'] as String, map['token'] as String);

  ResetPasswordToken toEntity() => ResetPasswordToken(userId, token);

  @override
  List<Object?> get props => [userId, token];
}
