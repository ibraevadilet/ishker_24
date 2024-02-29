import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';

class EsfInvoiceUseCase {
  EsfInvoiceUseCase({required this.repo});
  final EsfInvoiceRepo repo;

  Future<EsfModel> esfInvoice({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    try {
      return await repo.esfInvoice(
        createdDateFrom: createdDateFrom,
        createdDateTo: createdDateTo,
        exchangeCode: exchangeCode,
        statusCode: statusCode,
        invoiceNumber: invoiceNumber,
        contractorTin: contractorTin,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<EsfModel> esfIncome({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    try {
      return await repo.esfIncome(
        createdDateFrom: createdDateFrom,
        createdDateTo: createdDateTo,
        exchangeCode: exchangeCode,
        statusCode: statusCode,
        invoiceNumber: invoiceNumber,
        contractorTin: contractorTin,
      );
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
