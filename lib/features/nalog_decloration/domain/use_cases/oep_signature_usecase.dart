import 'package:ishker_24/features/nalog_decloration/data/models/check_oep_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/oep_signature_repository.dart';

class OepSignatureUseCase {
  final OepSignatureRepo repo;
  OepSignatureUseCase({
    required this.repo,
  });

  Future<CheckOepModel> checkOep() async {
    try {
      return await repo.checkOep();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendOtp(String authType) async {
    try {
      await repo.sendOtp(authType);
    } catch (e) {
      rethrow;
    }
  }
}
