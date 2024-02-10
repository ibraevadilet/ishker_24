import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';

class CreateAccountUseCase {
  final CreateAccountRepo repo;
  CreateAccountUseCase({
    required this.repo,
  });

  Future<void> createAccount() async {
    try {
      return await repo.createAccount();
    } catch (e) {
      rethrow;
    }
  }
}
