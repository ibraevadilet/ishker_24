import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaKkmRegistrationUseCase {
  final MegaKassaRepo repo;
  MegaKassaKkmRegistrationUseCase({
    required this.repo,
  });

  Future<MegaKassaKkmEntity> registerKkm({
    required MegaKassaKkmRegistrationEntity registrationEntity,
  }) async {
    try {
      return await repo.registerKkm(registrationEntity: registrationEntity);
    } catch (e) {
      rethrow;
    }
  }
}
