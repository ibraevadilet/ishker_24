import 'package:dio/dio.dart';
import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class EsfInvoiceRepoImpl implements EsfInvoiceRepo {
  EsfInvoiceRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<EsfModel> esfInvoice(
    String tin, {
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    Map<String, dynamic> getData = {'tin': tin};

    if (createdDateFrom != null) {
      getData.addEntries(
        {"createdDateFrom": createdDateFrom}.entries,
      );
    }
    if (createdDateTo != null) {
      getData.addEntries(
        {"createdDateTo": createdDateTo}.entries,
      );
    }
    if (exchangeCode != null) {
      getData.addEntries(
        {"exchangeCode": exchangeCode}.entries,
      );
    }
    if (statusCode != null) {
      getData.addEntries(
        {"statusCode": statusCode}.entries,
      );
    }
    if (invoiceNumber != null) {
      getData.addEntries(
        {"invoiceNumber": invoiceNumber}.entries,
      );
    }
    if (contractorTin != null) {
      getData.addEntries(
        {"contractorTin": contractorTin}.entries,
      );
    }
    try {
      final response = await dio.post(
        'gns/api/v1/realization',
        queryParameters: getData,
      );
      return EsfModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfModel> esfIncome(
    String tin, {
    String? createdDateFrom,
    String? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    Map<String, dynamic> getData = {'tin': tin};

    if (createdDateFrom != null) {
      getData.addEntries(
        {"createdDateFrom": createdDateFrom}.entries,
      );
    }
    if (createdDateTo != null) {
      getData.addEntries(
        {"createdDateTo": createdDateTo}.entries,
      );
    }
    if (exchangeCode != null) {
      getData.addEntries(
        {"exchangeCode": exchangeCode}.entries,
      );
    }
    if (statusCode != null) {
      getData.addEntries(
        {"statusCode": statusCode}.entries,
      );
    }
    if (invoiceNumber != null) {
      getData.addEntries(
        {"invoiceNumber": invoiceNumber}.entries,
      );
    }
    if (contractorTin != null) {
      getData.addEntries(
        {"contractorTin": contractorTin}.entries,
      );
    }
    try {
      final response = await dio.post(
        'gns/api/v1/income',
        queryParameters: getData,
      );
      return EsfModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfAcceptOrRejectModel> esfAcceptOrReject(
    String tin,
    List<String> documentUuids,
    int statusCode,
  ) async {
    try {
      final response = await dio.post(
        'gns/api/v1/acceptation',
        data: {
          "statusCode": statusCode,
          "documentUuids": documentUuids,
          "tin": tin,
        },
      );
      return EsfAcceptOrRejectModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfStatusModel> esfSatuses(String tin) async {
    try {
      final response = await dio.get(
        'gns/api/v1/statuses',
        queryParameters: {
          'tin': tin,
        },
      );
      return EsfStatusModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }
}
