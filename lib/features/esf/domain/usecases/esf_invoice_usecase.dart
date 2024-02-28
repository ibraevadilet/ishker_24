import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';

class EsfInvoiceUseCase {
  EsfInvoiceUseCase({required this.repo});
  final EsfInvoiceRepo repo;

  Future<EsfModel> esfInvoice(
    String tin, {
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    try {
      return await repo.esfInvoice(
        tin,
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

  Future<EsfModel> esfIncome(
    String tin, {
    String? createdDateFrom,
    String? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    try {
      return await repo.esfIncome(
        tin,
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
    String tin,
    List<String> documentUuids,
    int statusCode,
  ) async {
    try {
      return await repo.esfAcceptOrReject(
        tin,
        documentUuids,
        statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<EsfStatusModel> esfStatus(String tin) async {
    try {
      return await repo.esfSatuses(tin);
    } catch (e) {
      rethrow;
    }
  }
}
