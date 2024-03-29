// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

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

  @override
  bool operator ==(covariant EsfModel other) {
    if (identical(this, other)) return true;

    return other.requestId == requestId &&
        other.responseId == responseId &&
        other.userId == userId &&
        other.clientId == clientId &&
        listEquals(other.invoices, invoices) &&
        other.totalElements == totalElements &&
        other.totalPage == totalPage &&
        other.invoiceDate == invoiceDate;
  }

  @override
  int get hashCode {
    return requestId.hashCode ^
        responseId.hashCode ^
        userId.hashCode ^
        clientId.hashCode ^
        invoices.hashCode ^
        totalElements.hashCode ^
        totalPage.hashCode ^
        invoiceDate.hashCode;
  }

  EsfModel copyWith({
    String? requestId,
    String? responseId,
    String? userId,
    String? clientId,
    List<Invoice>? invoices,
    int? totalElements,
    int? totalPage,
    DateTime? invoiceDate,
  }) {
    return EsfModel(
      requestId: requestId ?? this.requestId,
      responseId: responseId ?? this.responseId,
      userId: userId ?? this.userId,
      clientId: clientId ?? this.clientId,
      invoices: invoices ?? this.invoices,
      totalElements: totalElements ?? this.totalElements,
      totalPage: totalPage ?? this.totalPage,
      invoiceDate: invoiceDate ?? this.invoiceDate,
    );
  }
}

class Invoice {
  final String documentUuid;
  final double totalAmount;
  final String createdDate;
  final String deliveryDate;
  final String invoiceDate;
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
        createdDate: json["createdDate"] ?? '',
        deliveryDate: json["deliveryDate"] ?? '',
        invoiceDate: json["invoiceDate"] ?? '',
        ownedCrmReceiptCode: json["ownedCrmReceiptCode"] ?? '',
        invoiceNumber: json["invoiceNumber"] ?? '',
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

  @override
  bool operator ==(covariant Invoice other) {
    if (identical(this, other)) return true;

    return other.documentUuid == documentUuid &&
        other.totalAmount == totalAmount &&
        other.createdDate == createdDate &&
        other.deliveryDate == deliveryDate &&
        other.invoiceDate == invoiceDate &&
        other.ownedCrmReceiptCode == ownedCrmReceiptCode &&
        other.invoiceNumber == invoiceNumber &&
        other.number == number &&
        other.note == note &&
        other.correctedReceiptUuid == correctedReceiptUuid &&
        other.legalPersonBankAccount == legalPersonBankAccount &&
        other.contractorBankAccount == contractorBankAccount &&
        other.isResident == isResident &&
        other.paymentType == paymentType &&
        other.currency == currency &&
        other.status == status &&
        other.receiptType == receiptType &&
        other.deliveryType == deliveryType &&
        other.legalPerson == legalPerson &&
        other.contractor == contractor &&
        other.vatTaxType == vatTaxType;
  }

  @override
  int get hashCode {
    return documentUuid.hashCode ^
        totalAmount.hashCode ^
        createdDate.hashCode ^
        deliveryDate.hashCode ^
        invoiceDate.hashCode ^
        ownedCrmReceiptCode.hashCode ^
        invoiceNumber.hashCode ^
        number.hashCode ^
        note.hashCode ^
        correctedReceiptUuid.hashCode ^
        legalPersonBankAccount.hashCode ^
        contractorBankAccount.hashCode ^
        isResident.hashCode ^
        paymentType.hashCode ^
        currency.hashCode ^
        status.hashCode ^
        receiptType.hashCode ^
        deliveryType.hashCode ^
        legalPerson.hashCode ^
        contractor.hashCode ^
        vatTaxType.hashCode;
  }
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

  @override
  bool operator ==(covariant Contractor other) {
    if (identical(this, other)) return true;

    return other.pin == pin &&
        other.fullName == fullName &&
        other.mainFullName == mainFullName &&
        other.mainPin == mainPin;
  }

  @override
  int get hashCode {
    return pin.hashCode ^
        fullName.hashCode ^
        mainFullName.hashCode ^
        mainPin.hashCode;
  }
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

  @override
  bool operator ==(covariant Currency other) {
    if (identical(this, other)) return true;

    return other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
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
