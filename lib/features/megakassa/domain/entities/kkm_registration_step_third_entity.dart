class MegaKassaKkmRegistrationStep3Entity {
  final String password;
  final String fm;
  final String kkmModel;
  MegaKassaKkmRegistrationStep3Entity({
    required this.password,
    required this.fm,
    required this.kkmModel,
  });

  MegaKassaKkmRegistrationStep3Entity copyWith({
    String? password,
    String? fm,
    String? kkmModel,
  }) {
    return MegaKassaKkmRegistrationStep3Entity(
      password: password ?? this.password,
      fm: fm ?? this.fm,
      kkmModel: kkmModel ?? this.kkmModel,
    );
  }

  @override
  String toString() =>
      'MegaKassaKkmRegistrationStep3Entity(password: $password, fm: $fm, kkmModel: $kkmModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaKkmRegistrationStep3Entity &&
        other.password == password &&
        other.fm == fm &&
        other.kkmModel == kkmModel;
  }

  @override
  int get hashCode => password.hashCode ^ fm.hashCode ^ kkmModel.hashCode;
}
