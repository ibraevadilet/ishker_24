import 'package:flutter/foundation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';

class MegaKassaKkmRegistrationStep1Entity {
  final bool isNdsPayer;
  final Activity paymentType;

  final Activity activity;
  final Activity code;
  final List<CalcItem> params;
  final Activity objectType;
  final TaxSystem mode;

  final String name;

  MegaKassaKkmRegistrationStep1Entity({
    required this.isNdsPayer,
    required this.paymentType,
    required this.activity,
    required this.code,
    required this.params,
    required this.objectType,
    required this.mode,
    required this.name,
  });

  MegaKassaKkmRegistrationStep1Entity copyWith({
    bool? isNdsPayer,
    Activity? paymentType,
    Activity? activity,
    Activity? code,
    List<CalcItem>? params,
    Activity? objectType,
    TaxSystem? mode,
    String? name,
  }) {
    return MegaKassaKkmRegistrationStep1Entity(
      isNdsPayer: isNdsPayer ?? this.isNdsPayer,
      paymentType: paymentType ?? this.paymentType,
      activity: activity ?? this.activity,
      code: code ?? this.code,
      params: params ?? this.params,
      objectType: objectType ?? this.objectType,
      mode: mode ?? this.mode,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'MegaKassaKkmRegistrationStep1Entity(isNdsPayer: $isNdsPayer, paymentType: $paymentType, activity: $activity, code: $code, params: $params, objectType: $objectType, mode: $mode, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaKkmRegistrationStep1Entity &&
        other.isNdsPayer == isNdsPayer &&
        other.paymentType == paymentType &&
        other.activity == activity &&
        other.code == code &&
        listEquals(other.params, params) &&
        other.objectType == objectType &&
        other.mode == mode &&
        other.name == name;
  }

  @override
  int get hashCode {
    return isNdsPayer.hashCode ^
        paymentType.hashCode ^
        activity.hashCode ^
        code.hashCode ^
        params.hashCode ^
        objectType.hashCode ^
        mode.hashCode ^
        name.hashCode;
  }
}
