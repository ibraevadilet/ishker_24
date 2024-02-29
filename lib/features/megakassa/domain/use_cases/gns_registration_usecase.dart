import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGnsRegistrationUseCase {
  final MegaKassaRepo repo;
  MegaKassaGnsRegistrationUseCase({
    required this.repo,
  });

  Future<(bool, MegaKassaKkmEntity?)> registerGns({
    MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    MegaKassaKkmRegistrationEntity? registrationKkmEntity,
    required String pincode,
  }) async {
    try {
      return await repo.registerGns(
        registrationEntity: registrationEntity,
        registrationKkmEntity: registrationKkmEntity,
        pincode: pincode,
      );
    } catch (e) {
      rethrow;
    }
  }
}
