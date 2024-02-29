import 'package:dio/dio.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/core/functions/saved_pin.dart';
import 'package:ishker_24/features/esf/data/models/esf_accept_or_reject_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/features/esf/data/models/esf_status_model.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class EsfInvoiceRepoImpl implements EsfInvoiceRepo {
  EsfInvoiceRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<EsfModel> esfInvoice({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    final pin = AppSavedPin.getPin();

    Map<String, dynamic> getData = {'tin': pin};

    if (createdDateFrom != null) {
      getData.addEntries(
        {
          "createdDateFrom":
              AppDateFormats.formatyyyyMMDd.format(createdDateFrom)
        }.entries,
      );
    }
    if (createdDateTo != null) {
      getData.addEntries(
        {"createdDateTo": AppDateFormats.formatyyyyMMDd.format(createdDateTo)}
            .entries,
      );
    }
    if (exchangeCode != null) {
      getData.addEntries(
        {
          "exchangeCode": exchangeCode,
        }.entries,
      );
    }
    if (statusCode != null) {
      getData.addEntries(
        {
          "statusCode": statusCode,
        }.entries,
      );
    }
    if (invoiceNumber != null) {
      getData.addEntries(
        {
          "invoiceNumber": invoiceNumber,
        }.entries,
      );
    }
    if (contractorTin != null) {
      getData.addEntries(
        {
          "contractorTin": contractorTin,
        }.entries,
      );
    }
    try {
      final response = await dio.post(
        'esf/gns/api/v1/realization',
        queryParameters: getData,
      );
      return EsfModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfModel> esfIncome({
    DateTime? createdDateFrom,
    DateTime? createdDateTo,
    String? exchangeCode,
    String? statusCode,
    String? invoiceNumber,
    String? contractorTin,
  }) async {
    final pin = AppSavedPin.getPin();
    Map<String, dynamic> getData = {'tin': pin};

    if (createdDateFrom != null) {
      getData.addEntries(
        {
          "createdDateFrom":
              AppDateFormats.formatyyyyMMDd.format(createdDateFrom)
        }.entries,
      );
    }
    if (createdDateTo != null) {
      getData.addEntries(
        {"createdDateTo": AppDateFormats.formatyyyyMMDd.format(createdDateTo)}
            .entries,
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
        'esf/gns/api/v1/income',
        queryParameters: getData,
      );
      return EsfModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfAcceptOrRejectModel> esfAcceptOrReject(
    List<String> documentUuids,
    int statusCode,
  ) async {
    final pin = AppSavedPin.getPin();
    try {
      final response = await dio.post(
        'esf/gns/api/v1/acceptation',
        data: {
          "statusCode": statusCode,
          "documentUuids": documentUuids,
          "tin": pin,
        },
      );
      return EsfAcceptOrRejectModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }

  @override
  Future<EsfStatusModel> esfSatuses() async {
    final pin = AppSavedPin.getPin();
    try {
      final response = await dio.get(
        'esf/gns/api/v1/statuses',
        queryParameters: {
          'tin': pin,
        },
      );
      return EsfStatusModel.fromJson(response.data);
    } catch (e) {
      throw CatchException(message: e.toString());
    }
  }
}