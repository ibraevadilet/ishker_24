import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';

abstract class EsfInvoiceRepo {
  Future<EsfModel> esfInvoice({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  });
  Future<EsfModel> esfIncome({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  });
  Future<EsfAcceptOrRejectModel> esfAcceptOrReject(
    List<String> documentUuids,
    int statusCode,
  );
  Future<EsfStatusModel> esfSatuses();
}
