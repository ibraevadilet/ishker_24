import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/data/models/get_esf_qwery_model.dart';

abstract class EsfInvoiceRepo {
  Future<EsfModel> esfReports(GetEsfQweryModel model);
  Future<void> esfAcceptOrReject(
    List<String> documentUuids,
    int statusCode,
  );
  Future<EsfStatusModel> esfSatuses();
}
