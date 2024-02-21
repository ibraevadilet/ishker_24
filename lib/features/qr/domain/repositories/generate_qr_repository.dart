import 'package:ishker_24/core/utils/result.dart';

import '../use_cases/generate_qr_usecase.dart';

abstract class GenerateQrRepo {
  Future<Result<String, Exception>> generateQr(GenerateQrParams params);
}
