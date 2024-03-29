import 'package:ishker_24/features/nalog_decloration/domain/repositories/send_nalog_data_repository.dart';

class SendNalogDataUseCase {
  final SendNalogDataRepo repo;
  SendNalogDataUseCase({
    required this.repo,
  });

  Future<void> sendNalogData(
      Map<String, dynamic> sendModel, String type) async {
    try {
      await repo.sendNalogData(sendModel, type);
    } catch (e) {
      rethrow;
    }
  }
}
