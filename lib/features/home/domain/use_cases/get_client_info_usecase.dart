import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/repositories/get_client_info_repository.dart';

class GetClientInfoUseCase {
  final GetClientInfoRepo repo;
  GetClientInfoUseCase({
    required this.repo,
  });

  Future<ClientInfoModel> getClientInfo() async {
    try {
      return await repo.getClientInfo();
    } catch (e) {
      rethrow;
    }
  }
}
