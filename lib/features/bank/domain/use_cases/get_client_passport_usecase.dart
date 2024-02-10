import 'package:ishker_24/features/bank/data/models/get_client_passport_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/get_client_passport_repository.dart';

class GetClientPassportUseCase {
  final GetClientPassportRepo repo;
  GetClientPassportUseCase({
    required this.repo,
  });

  Future<ClientPassportModel> getClientPassport() async {
    try {
      return await repo.getClientPassport();
    } catch (e) {
      rethrow;
    }
  }
}
