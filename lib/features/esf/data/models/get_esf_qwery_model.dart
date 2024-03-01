import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';

class GetEsfQweryModel {
  final String pin;
  final int page;
  final ESFType type;
  final DateTime? createdDateFrom;
  final DateTime? createdDateTo;
  final String? exchangeCode;
  final String? statusCode;
  final String? invoiceNumber;
  final String? contractorTin;
  GetEsfQweryModel({
    required this.pin,
    required this.page,
    required this.type,
    this.createdDateFrom,
    this.createdDateTo,
    this.exchangeCode,
    this.statusCode,
    this.invoiceNumber,
    this.contractorTin,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> getData = {
      'tin': pin,
      'page': page,
    };

    if (createdDateFrom != null) {
      getData.addEntries(
        {
          "createdDateFrom":
              AppDateFormats.formatyyyyMMDd.format(createdDateFrom!)
        }.entries,
      );
    }
    if (createdDateTo != null) {
      getData.addEntries(
        {"createdDateTo": AppDateFormats.formatyyyyMMDd.format(createdDateTo!)}
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

    return getData;
  }
}
