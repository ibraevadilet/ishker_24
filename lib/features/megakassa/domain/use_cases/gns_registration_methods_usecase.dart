import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';

class MegaKassaGnsRegistrationMethodsUseCase {
  final MegaKassaRepo repo;
  MegaKassaGnsRegistrationMethodsUseCase({
    required this.repo,
  });

  Future<List<PinCodeTypesModel>> getGnsMethods() async {
    try {
      return await repo.getGnsMethods();
    } catch (e) {
      rethrow;
    }
  }
}
