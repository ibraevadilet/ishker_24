import 'package:ishker_24/features/esf/domain/repositories/esf_check_repository.dart';

class EsfCheckUseCase {
  EsfCheckUseCase({required this.repo});
  final EsfCheckRepo repo;
  Future<bool> esfCheck(String tin) async {
    try {
     return await repo.esfCheck(tin);
    } catch (e) {
      rethrow;
    }
  }
}
