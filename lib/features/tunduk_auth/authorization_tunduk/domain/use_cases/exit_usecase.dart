import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/exit_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExitUseCase {
  final ExitRepo repo;
  final SharedPreferences prefs;
  ExitUseCase({
    required this.repo,
    required this.prefs,
  });

  Future<void> exit() async {
    try {
      await repo.exit();
      prefs.clear();
    } catch (e) {
      rethrow;
    }
  }
}
