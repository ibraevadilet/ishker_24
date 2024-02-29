import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/domain/repositories/account_repo.dart';

class HistoryUseCase {
  HistoryUseCase(this.repo);

  final AccountRepo repo;

  Future<HistoryModel> call(HistoryRequestModel model) async {
    try {
      return await repo.history(model);
    } catch (e) {
      rethrow;
    }
  }
}
