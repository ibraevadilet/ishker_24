import 'package:ishker_24/features/megakassa/domain/entities/profile_entity.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGetProfileInfoUseCase {
  final MegaKassaRepo repo;
  MegaKassaGetProfileInfoUseCase({
    required this.repo,
  });

  Future<MegaKassaProfileEntity> getProfileInfo() async {
    try {
      return await repo.getProfileInfo();
    } catch (e) {
      rethrow;
    }
  }
}
