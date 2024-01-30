class ResetPasswordTokenModel {
  final String userId;
  final String token;
  ResetPasswordTokenModel({
    required this.userId,
    required this.token,
  });

  factory ResetPasswordTokenModel.fromJson(Map<String, dynamic> map) {
    return ResetPasswordTokenModel(
      userId: map['userId'] as String,
      token: map['token'] as String,
    );
  }
}
