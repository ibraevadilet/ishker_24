import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGetStepsInfoUseCase {
  final MegaKassaRepo repo;
  MegaKassaGetStepsInfoUseCase({
    required this.repo,
  });

  Future<MegaKassaStepsInfoEntity> getStepsInfo() async {
    try {
      return await repo.getStepsInfo();
    } catch (e) {
      rethrow;
    }
  }
}
