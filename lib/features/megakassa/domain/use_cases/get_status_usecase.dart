import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGetStatusUseCase {
  final MegaKassaRepo repo;
  MegaKassaGetStatusUseCase({
    required this.repo,
  });

  Future<bool> getMegakassaStatus() async {
    try {
      return await repo.getMegakassaStatus();
    } catch (e) {
      rethrow;
    }
  }
}
