class EsfModel {
  final String requestId;
  final String responseId;
  final String userId;
  final String clientId;
  final List<Invoice> invoices;
  final int totalElements;
  final int totalPage;
  final DateTime invoiceDate;

  EsfModel({
    required this.requestId,
    required this.responseId,
    required this.userId,
    required this.clientId,
    required this.invoices,
    required this.totalElements,
    required this.totalPage,
    required this.invoiceDate,
  });

  factory EsfModel.fromJson(Map<String, dynamic> json) => EsfModel(
        requestId: json["requestId"] ?? '',
        responseId: json["responseId"] ?? ' ',
        userId: json["userId"] ?? '',
        clientId: json["clientId"] ?? '',
        invoices: List<Invoice>.from(
            json["invoices"].map((x) => Invoice.fromJson(x)) ?? []),
        totalElements: json["totalElements"] ?? 0,
        totalPage: json["totalPage"] ?? 0,
        invoiceDate: json["invoiceDate"] ?? DateTime.now(),
      );
}

class Invoice {
  final String documentUuid;
  final double totalAmount;
  final DateTime createdDate;
  final DateTime deliveryDate;
  final DateTime invoiceDate;
  final String ownedCrmReceiptCode;
  final String invoiceNumber;
  final String number;
  final String note;
  final String correctedReceiptUuid;
  final dynamic legalPersonBankAccount;
  final dynamic contractorBankAccount;
  final String isResident;
  final Currency paymentType;
  final Currency currency;
  final Currency status;
  final Currency receiptType;
  final Currency deliveryType;
  final Contractor legalPerson;
  final Contractor contractor;
  final VatTaxType vatTaxType;

  Invoice({
    required this.documentUuid,
    required this.totalAmount,
    required this.createdDate,
    required this.deliveryDate,
    required this.invoiceDate,
    required this.ownedCrmReceiptCode,
    required this.invoiceNumber,
    required this.number,
    required this.note,
    required this.correctedReceiptUuid,
    required this.legalPersonBankAccount,
    required this.contractorBankAccount,
    required this.isResident,
    required this.paymentType,
    required this.currency,
    required this.status,
    required this.receiptType,
    required this.deliveryType,
    required this.legalPerson,
    required this.contractor,
    required this.vatTaxType,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        documentUuid: json["documentUuid"] ?? '',
        totalAmount: json["totalAmount"] ?? 0.0,
        createdDate: DateTime.parse(json["createdDate"] ?? DateTime.now()),
        deliveryDate: DateTime.parse(json["deliveryDate"] ?? DateTime.now()),
        invoiceDate: json["invoiceDate"] ?? DateTime.now(),
        ownedCrmReceiptCode: json["ownedCrmReceiptCode"] ?? '',
        invoiceNumber: json["invoiceNumber"] ?? '0',
        number: json["number"] ?? '',
        note: json["note"] ?? '',
        correctedReceiptUuid: json["correctedReceiptUuid"] ?? '',
        legalPersonBankAccount: json["legalPersonBankAccount"] ?? '',
        contractorBankAccount: json["contractorBankAccount"] ?? '',
        isResident: json["isResident"] ?? '',
        paymentType: Currency.fromJson(json["paymentType"] ?? ''),
        currency: Currency.fromJson(json["currency"] ?? ''),
        status: Currency.fromJson(json["status"] ?? ''),
        receiptType: Currency.fromJson(json["receiptType"] ?? ''),
        deliveryType: Currency.fromJson(json["deliveryType"] ?? ''),
        legalPerson: Contractor.fromJson(json["legalPerson"] ?? ''),
        contractor: Contractor.fromJson(json["contractor"] ?? ''),
        vatTaxType: VatTaxType.fromJson(json["vatTaxType"] ?? ''),
      );
}

class Contractor {
  final String pin;
  final String fullName;
  final dynamic mainFullName;
  final dynamic mainPin;

  Contractor({
    required this.pin,
    required this.fullName,
    required this.mainFullName,
    required this.mainPin,
  });

  factory Contractor.fromJson(Map<String, dynamic> json) => Contractor(
        pin: json["pin"] ?? '',
        fullName: json["fullName"] ?? '',
        mainFullName: json["mainFullName"] ?? '',
        mainPin: json["mainPin"] ?? '',
      );
}

class Currency {
  final String code;
  final String name;

  Currency({
    required this.code,
    required this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"] ?? '',
        name: json["name"] ?? '',
      );
}

class VatTaxType {
  final String rate;
  final String name;

  VatTaxType({
    required this.rate,
    required this.name,
  });

  factory VatTaxType.fromJson(Map<String, dynamic> json) => VatTaxType(
        rate: json["rate"] ?? '',
        name: json["name"] ?? '',
      );
}
