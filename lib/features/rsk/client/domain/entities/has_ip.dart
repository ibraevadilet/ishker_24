import 'package:equatable/equatable.dart';

class HasIP extends Equatable {
  const HasIP({
    required this.gnsStatus,
    required this.declinedReason,
    this.tin,
    this.image,
    this.created,
    this.firstName,
    this.lastName,
    this.middleName,
    this.isNewIp = false,
  });

  final String gnsStatus;
  final String declinedReason;
  final String? tin;
  final String? image;
  final DateTime? created;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final bool isNewIp;

  bool get isRefused => gnsStatus == 'REFUSED';
  bool get isInProccess => gnsStatus == 'IN_PROCESS';

  @override
  List<Object?> get props => [
        gnsStatus,
        declinedReason,
        tin,
        image,
        created,
        firstName,
        lastName,
        middleName,
        isNewIp,
      ];
}
