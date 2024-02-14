import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/home/domain/repositories/check_has_ip_repository.dart';

class CheckHasIPUseCase {
  CheckHasIPUseCase({required this.repo});
  final CheckHasIPRepo repo;

  String certificatUrl = 'https://www.orimi.com/pdf-test.pdf';

  Future<CheckHasIPModel?> checkIp() async {
    try {
      final result = await repo.checkHasIP();
      if (result != null) {
        if (result.gnsStatus == 'APPROVED') {
          certificatUrl = result.image!;
        }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkHasBank() async {
    try {
      return await repo.checkHasBank();
    } catch (e) {
      rethrow;
    }
  }
}
