import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/check_grnp_repository.dart';

class CheckGrnpUseCase {
  final CheckGrnpRepo repo;
  CheckGrnpUseCase({
    required this.repo,
  });

  Future<bool> checkGrnp() async {
    try {
      return await repo.checkGrnp();
    } catch (e) {
      rethrow;
    }
  }
}
