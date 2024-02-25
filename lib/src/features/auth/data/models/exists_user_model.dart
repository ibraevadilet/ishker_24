import 'package:equatable/equatable.dart';

class ExistsUserModelX extends Equatable {
  final String persistentToken;
  final String pin;

  const ExistsUserModelX({
    required this.persistentToken,
    required this.pin,
  });

  factory ExistsUserModelX.fromJson(Map<String, dynamic> json) =>
      ExistsUserModelX(
        persistentToken: json["persistentToken"],
        pin: json["pin"],
      );

  @override
  List<Object?> get props => [persistentToken, pin];
}
