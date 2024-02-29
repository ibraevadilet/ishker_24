import 'package:ishker_24/features/esf/domain/repositories/esf_check_repository.dart';

class EsfCheckUseCase {
  EsfCheckUseCase({required this.repo});
  final EsfCheckRepo repo;
  Future<bool> esfCheck() async {
    try {
      return await repo.esfCheck();
    } catch (e) {
      rethrow;
    }
  }
}
