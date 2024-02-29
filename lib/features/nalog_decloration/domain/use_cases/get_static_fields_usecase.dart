import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_static_fields_repository.dart';

class GetStaticFieldsUseCase {
  final GetStaticFieldsRepo repo;
  GetStaticFieldsUseCase({
    required this.repo,
  });

  Future<Map<String, dynamic>> getStaticFields(String type) async {
    try {
      return await repo.getStaticFields(type);
    } catch (e) {
      rethrow;
    }
  }
}
