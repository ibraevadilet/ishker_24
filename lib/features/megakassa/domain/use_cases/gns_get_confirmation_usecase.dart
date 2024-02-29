import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';

class MegaKassaGnsGetConfirmationUseCase {
  final MegaKassaRepo repo;
  MegaKassaGnsGetConfirmationUseCase({
    required this.repo,
  });

  Future<bool> getGnsConfirmation({required String method}) async {
    try {
      return await repo.getGetConfirmation(method: method);
    } catch (e) {
      rethrow;
    }
  }
}
