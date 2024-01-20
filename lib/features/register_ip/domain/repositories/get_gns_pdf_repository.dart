import 'package:ishker_24/features/register_ip/data/models/get_gns_pdf_model.dart';

abstract class GetGnsPdfRepo {
  Future<String> getGnsPdf(GetGnsPdfModel model);
}
