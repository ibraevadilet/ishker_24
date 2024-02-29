abstract class SaveTokenRepo {
  Future<void> saveToken({
    required String data,
    required bool isFile,
    String? fileName,
  });
}
