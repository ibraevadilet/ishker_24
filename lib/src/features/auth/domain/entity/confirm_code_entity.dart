import 'package:equatable/equatable.dart';

class ConfirmCodeEntity extends Equatable {
  const ConfirmCodeEntity(
    this.persistentSessionToken,
    this.signInResult,
  );

  final String persistentSessionToken;
  final String signInResult;

  bool get isSucceeded => signInResult == 'Succeeded';

  @override
  List<Object?> get props => [persistentSessionToken, signInResult];
}
