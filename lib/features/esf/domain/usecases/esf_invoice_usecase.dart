import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/data/models/get_esf_qwery_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';

class EsfInvoiceUseCase {
  EsfInvoiceUseCase({required this.repo});
  final EsfInvoiceRepo repo;

  List<Invoice> invoices = [];

  Future<EsfModel> esfReports(GetEsfQweryModel model) async {
    try {
      final result = await repo.esfReports(model);
      invoices.addAll(result.invoices);
      return result.copyWith(invoices: invoices);
    } catch (e) {
      rethrow;
    }
  }

  Future<EsfAcceptOrRejectModel> esfAcceptOrReject(
    List<String> documentUuids,
    int statusCode,
  ) async {
    try {
      return await repo.esfAcceptOrReject(
        documentUuids,
        statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<EsfStatusModel> esfStatus() async {
    try {
      return await repo.esfSatuses();
    } catch (e) {
      rethrow;
    }
  }
}
