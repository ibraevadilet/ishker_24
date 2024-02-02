import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/home/domain/repository/check_has_ip_repository.dart';

class CheckHasIPUseCase {
  CheckHasIPUseCase({required this.repo});
  final CheckHasIPRepo repo;

  Future<CheckHasIPModel> checkIp() async {
    try {
      return await repo.checkHasIP();
    } catch (e) {
      rethrow;
    }
  }
}
