import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGetKkmListUseCase {
  final MegaKassaRepo repo;
  MegaKassaGetKkmListUseCase({
    required this.repo,
  });

  Future<List<MegaKassaKkmEntity>?> getKkmList() async {
    try {
      return await repo.getKkmList();
    } catch (e) {
      rethrow;
    }
  }
}
