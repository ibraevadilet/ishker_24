import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_detail_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/profile_entity.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';

abstract class MegaKassaRepo {
  Future<bool> getMegakassaStatus();
  Future<MegaKassaProfileEntity> getProfileInfo();
  Future<MegaKassaStepsInfoEntity> getStepsInfo();
  Future<List<PinCodeTypesModel>> getGnsMethods();
  Future<bool> getGetConfirmation({required String method});
  Future<List<MegaKassaKkmEntity>?> getKkmList();
  Future<MegaKassaKkmDetailEntity> getKkmDetail({
    required String cashboxId,
  });
  Future<(String, MegaKassaKkmEntity?, int)> registerGns({
    required String pincode,
    required MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    required MegaKassaKkmRegistrationEntity? registrationKkmEntity,
  });
  Future<MegaKassaKkmEntity> registerKkm({
    required MegaKassaKkmRegistrationEntity registrationEntity,
  });
}
