import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';

class CreateAccountUseCase {
  final CreateAccountRepo repo;
  CreateAccountUseCase({
    required this.repo,
  });

  Future<String> createAccount(String partyId, String bic) async {
    try {
      return await repo.createAccount(partyId, bic);
    } catch (e) {
      rethrow;
    }
  }
}
