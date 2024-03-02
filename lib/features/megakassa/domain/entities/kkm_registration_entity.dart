import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_first_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_second_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_third_entity.dart';

class MegaKassaKkmRegistrationEntity {
  final MegaKassaKkmRegistrationStep1Entity? step1Entity;
  final MegaKassaKkmRegistrationStep2Entity? step2Entity;
  final MegaKassaKkmRegistrationStep3Entity? step3Entity;
  MegaKassaKkmRegistrationEntity({
    this.step1Entity,
    this.step2Entity,
    this.step3Entity,
  });

  MegaKassaKkmRegistrationEntity copyWith({
    MegaKassaKkmRegistrationStep1Entity? step1entity,
    MegaKassaKkmRegistrationStep2Entity? step2Entity,
    MegaKassaKkmRegistrationStep3Entity? step3Entity,
  }) {
    return MegaKassaKkmRegistrationEntity(
      step1Entity: step1entity ?? step1Entity,
      step2Entity: step2Entity ?? this.step2Entity,
      step3Entity: step3Entity ?? this.step3Entity,
    );
  }

  @override
  String toString() =>
      'MegaKassaKkmRegistrationEntity(step1entity: $step1Entity, step2Entity: $step2Entity, step3Entity: $step3Entity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaKkmRegistrationEntity &&
        other.step1Entity == step1Entity &&
        other.step2Entity == step2Entity &&
        other.step3Entity == step3Entity;
  }

  @override
  int get hashCode =>
      step1Entity.hashCode ^ step2Entity.hashCode ^ step3Entity.hashCode;

  Map<String, dynamic> toJson() => {
        "taxSystemCodes": [step1Entity?.mode.code],
        "entrepreneurshipObjectCode": step1Entity?.objectType.code,
        "taxAuthorityDepartmentCode": step1Entity?.code.code,
        "businessActivityCode": step1Entity?.activity.code,
        "shopName": step1Entity?.name,
        "calcItemTypeCode": step1Entity?.params.map((e) => e.code).toList(),
        "cashBoxAddress": {
          "name": "адрес",
          "region": step2Entity?.region,
          "index": step2Entity?.index,
          "city": step2Entity?.locality,
          "street": step2Entity?.street,
          "homeNumber": step2Entity?.houseNumber,
          "lat": (step2Entity?.lat.replaceAll(',', '.')) ?? '0.0',
          "lon": (step2Entity?.long.replaceAll(',', '.')) ?? '0.0',
        },
        "sellPlaceCode": step1Entity?.paymentType.code,
        "password": step3Entity?.password,
        "vatPayer": step1Entity?.isNdsPayer
      };

  Map<String, dynamic> toParams() => {
        "taxSystemNames": step1Entity?.mode.taxName,
        "entrepreneurshipObjecName": step1Entity?.objectType.name,
        "taxAuthorityDepartmenName": step1Entity?.code.name,
        "businessActivitName": step1Entity?.activity.name,
        "modelName": step3Entity?.kkmModel,
        "calcItemTypeNames":
            step1Entity?.params.map((e) => e.attributeName).toList(),
        "sellPlaceName": step1Entity?.paymentType.name,
      };
}
