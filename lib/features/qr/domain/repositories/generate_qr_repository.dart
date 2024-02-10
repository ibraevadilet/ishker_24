import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';

abstract class GenerateQrRepo {
  Future<String> generateQr(GenerateQrPostModel model);
}
