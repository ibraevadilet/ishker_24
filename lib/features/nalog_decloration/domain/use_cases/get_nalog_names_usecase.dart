import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_nalog_names_repository.dart';

class GetNalogNamesUseCase {
  final GetNalogNamesRepo repo;
  GetNalogNamesUseCase({
    required this.repo,
  });

  Future<List<NalogNameModel>> getNalogNames() async {
    try {
      return await repo.getNalogNames();
    } catch (e) {
      rethrow;
    }
  }
}
