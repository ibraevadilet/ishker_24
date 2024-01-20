class UserNalogTypesModel {
  final String tin;
  final String phoneNumber;
  final String email;
  final String activityCode;
  final bool isHaveWageEarners;
  final int taxMode;
  final int entrepreneurType;
  final List<int> selectedModes;
  UserNalogTypesModel({
    required this.tin,
    required this.phoneNumber,
    required this.email,
    required this.activityCode,
    required this.isHaveWageEarners,
    required this.taxMode,
    required this.entrepreneurType,
    required this.selectedModes,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tin': tin,
      'phoneNumber': phoneNumber,
      'email': email,
      'activityCode': activityCode,
      'isHaveWageEarners': isHaveWageEarners,
      'taxMode': taxMode,
      'entrepreneurType': entrepreneurType,
      'selectedModes': selectedModes,
    };
  }
}
