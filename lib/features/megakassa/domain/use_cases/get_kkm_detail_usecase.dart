import 'package:ishker_24/features/megakassa/domain/entities/kkm_detail_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGetKkmDetailUseCase {
  final MegaKassaRepo repo;
  MegaKassaGetKkmDetailUseCase({
    required this.repo,
  });

  Future<MegaKassaKkmDetailEntity> getKkmDetail({
    required String cashboxId,
  }) async {
    try {
      return await repo.getKkmDetail(cashboxId: cashboxId);
    } catch (e) {
      rethrow;
    }
  }
}
