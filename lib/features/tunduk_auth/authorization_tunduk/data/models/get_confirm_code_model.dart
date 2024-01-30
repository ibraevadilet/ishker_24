class GetConfirmCodeModel {
  final String persistentSessionToken;
  final String signInResult;
  GetConfirmCodeModel({
    required this.persistentSessionToken,
    required this.signInResult,
  });

  factory GetConfirmCodeModel.fromJson(Map<String, dynamic> map) {
    return GetConfirmCodeModel(
      persistentSessionToken: map['persistentSessionToken'] as String,
      signInResult: map['signInResult'] as String,
    );
  }
}
