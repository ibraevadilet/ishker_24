import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/domain/repositories/account_repo.dart';

class AccountInfoUseCase {
  final AccountRepo repo;
  AccountInfoUseCase({required this.repo});

  Future<AccountModel> call(String account) async {
    try {
      return await repo.info(account);
    } catch (e) {
      rethrow;
    }
  }
}
