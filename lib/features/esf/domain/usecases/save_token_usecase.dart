import 'package:ishker_24/features/esf/domain/repositories/save_token_repository.dart';

class SaveTokenUseCase {
  final SaveTokenRepo repo;
  SaveTokenUseCase({
    required this.repo,
  });

  Future<void> saveToken({
    required String data,
    required bool isFile,
    String? fileName,
  }) async {
    try {
      await repo.saveToken(data: data, isFile: isFile, fileName: fileName);
    } catch (e) {
      rethrow;
    }
  }
}
