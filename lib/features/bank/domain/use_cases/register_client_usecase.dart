import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';

class RegisterClientUseCase {
  final RegisterClientRepo repo;
  RegisterClientUseCase({
    required this.repo,
  });

  Future<String> registerClient(RegisterClientPostModel model) async {
    try {
      return await repo.registerClient(model);
    } catch (e) {
      rethrow;
    }
  }
}
