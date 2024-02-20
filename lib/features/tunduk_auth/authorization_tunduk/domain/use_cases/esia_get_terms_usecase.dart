import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/esia_get_terms_repository.dart';

class EsiaGetTermsUseCase {
  final EsiaGetTermsRepo repo;
  EsiaGetTermsUseCase({
    required this.repo,
  });

  Future<String> esiaGetTerms() async {
    try {
      return await repo.esiaGetTerms();
    } catch (e) {
      rethrow;
    }
  }
}
