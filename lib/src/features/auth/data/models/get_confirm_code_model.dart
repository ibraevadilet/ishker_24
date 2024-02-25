import 'package:equatable/equatable.dart';

import '../../domain/entity/confirm_code_entity.dart';

class GetConfirmCodeModel extends Equatable {
  const GetConfirmCodeModel(
    this.persistentSessionToken,
    this.signInResult,
  );

  final String persistentSessionToken;
  final String signInResult;

  factory GetConfirmCodeModel.fromJson(Map<String, dynamic> map) {
    return GetConfirmCodeModel(
      map['persistentSessionToken'] as String,
      map['signInResult'] as String,
    );
  }

  ConfirmCodeEntity toEntity() => ConfirmCodeEntity(
        persistentSessionToken,
        signInResult,
      );

  @override
  List<Object?> get props => [persistentSessionToken, signInResult];
}
