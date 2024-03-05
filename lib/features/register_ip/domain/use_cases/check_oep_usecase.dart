import 'package:ishker_24/features/register_ip/domain/repositories/check_oep_repository.dart';

class CheckOepUseCase {
  final CheckOepRepo repo;
  CheckOepUseCase({
    required this.repo,
  });

  Future<void> checkOep() async {
    try {
      await repo.checkOep();
    } catch (e) {
      rethrow;
    }
  }
}
