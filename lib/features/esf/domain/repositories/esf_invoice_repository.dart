import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';

abstract class EsfInvoiceRepo {
  Future<EsfModel> esfInvoice(
    String tin,  {
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  });
  Future<EsfModel> esfIncome(
    String tin, {
    String? createdDateFrom,
    String? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  });
  Future<EsfAcceptOrRejectModel> esfAcceptOrReject(
    String tin,
    List<String> documentUuids,
    int statusCode,
  );
  Future<EsfStatusModel> esfSatuses(String tin);
}
