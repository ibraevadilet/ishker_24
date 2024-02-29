// To parse this JSON data, do
//
//     final megaKassaKkmDetailEntity = megaKassaKkmDetailEntityFromJson(jsonString);

import 'dart:convert';

MegaKassaKkmDetailEntity megaKassaKkmDetailEntityFromJson(String str) =>
    MegaKassaKkmDetailEntity.fromJson(json.decode(str));

String megaKassaKkmDetailEntityToJson(MegaKassaKkmDetailEntity data) =>
    json.encode(data.toJson());

class MegaKassaKkmDetailEntity {
  final int? id;
  final String? tin;
  final String? rnm;
  final String? fm;
  final DateTime? addDate;
  final DateTime? endDate;
  final String? status;
  final CashBoxVersion? cashBoxVersion;
  final String? shopName;
  final BusinessActivity? businessActivity;
  final BusinessActivity? entrepreneurship;
  final BusinessActivity? sellPlace;
  final BusinessActivity? taxAuthDep;
  final String? index;
  final String? region;
  final String? city;
  final String? street;
  final String? homeNumber;
  final String? lat;
  final String? lon;
  final int? clientId;
  final String? companyName;
  final int? cashBoxDetailsId;
  final bool? vatPayer;
  final List<CalcItem>? calcItems;
  final List<TaxSystem>? taxSystems;
  final dynamic pauseStartDate;
  final dynamic pauseEndDate;

  MegaKassaKkmDetailEntity({
    this.id,
    this.tin,
    this.rnm,
    this.fm,
    this.addDate,
    this.endDate,
    this.status,
    this.cashBoxVersion,
    this.shopName,
    this.businessActivity,
    this.entrepreneurship,
    this.sellPlace,
    this.taxAuthDep,
    this.index,
    this.region,
    this.city,
    this.street,
    this.homeNumber,
    this.lat,
    this.lon,
    this.clientId,
    this.companyName,
    this.cashBoxDetailsId,
    this.vatPayer,
    this.calcItems,
    this.taxSystems,
    this.pauseStartDate,
    this.pauseEndDate,
  });

  MegaKassaKkmDetailEntity copyWith({
    int? id,
    String? tin,
    String? rnm,
    String? fm,
    DateTime? addDate,
    DateTime? endDate,
    String? status,
    CashBoxVersion? cashBoxVersion,
    String? shopName,
    BusinessActivity? businessActivity,
    BusinessActivity? entrepreneurship,
    BusinessActivity? sellPlace,
    BusinessActivity? taxAuthDep,
    String? index,
    String? region,
    String? city,
    String? street,
    String? homeNumber,
    String? lat,
    String? lon,
    int? clientId,
    String? companyName,
    int? cashBoxDetailsId,
    bool? vatPayer,
    List<CalcItem>? calcItems,
    List<TaxSystem>? taxSystems,
    dynamic pauseStartDate,
    dynamic pauseEndDate,
  }) =>
      MegaKassaKkmDetailEntity(
        id: id ?? this.id,
        tin: tin ?? this.tin,
        rnm: rnm ?? this.rnm,
        fm: fm ?? this.fm,
        addDate: addDate ?? this.addDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        cashBoxVersion: cashBoxVersion ?? this.cashBoxVersion,
        shopName: shopName ?? this.shopName,
        businessActivity: businessActivity ?? this.businessActivity,
        entrepreneurship: entrepreneurship ?? this.entrepreneurship,
        sellPlace: sellPlace ?? this.sellPlace,
        taxAuthDep: taxAuthDep ?? this.taxAuthDep,
        index: index ?? this.index,
        region: region ?? this.region,
        city: city ?? this.city,
        street: street ?? this.street,
        homeNumber: homeNumber ?? this.homeNumber,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        clientId: clientId ?? this.clientId,
        companyName: companyName ?? this.companyName,
        cashBoxDetailsId: cashBoxDetailsId ?? this.cashBoxDetailsId,
        vatPayer: vatPayer ?? this.vatPayer,
        calcItems: calcItems ?? this.calcItems,
        taxSystems: taxSystems ?? this.taxSystems,
        pauseStartDate: pauseStartDate ?? this.pauseStartDate,
        pauseEndDate: pauseEndDate ?? this.pauseEndDate,
      );

  factory MegaKassaKkmDetailEntity.fromJson(Map<String, dynamic> json) =>
      MegaKassaKkmDetailEntity(
        id: json["id"],
        tin: json["tin"],
        rnm: json["rnm"],
        fm: json["fm"],
        addDate:
            json["addDate"] == null ? null : DateTime.parse(json["addDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        status: json["status"],
        cashBoxVersion: json["cashBoxVersion"] == null
            ? null
            : CashBoxVersion.fromJson(json["cashBoxVersion"]),
        shopName: json["shopName"],
        businessActivity: json["businessActivity"] == null
            ? null
            : BusinessActivity.fromJson(json["businessActivity"]),
        entrepreneurship: json["entrepreneurship"] == null
            ? null
            : BusinessActivity.fromJson(json["entrepreneurship"]),
        sellPlace: json["sellPlace"] == null
            ? null
            : BusinessActivity.fromJson(json["sellPlace"]),
        taxAuthDep: json["taxAuthDep"] == null
            ? null
            : BusinessActivity.fromJson(json["taxAuthDep"]),
        index: json["index"],
        region: json["region"],
        city: json["city"],
        street: json["street"],
        homeNumber: json["homeNumber"],
        lat: json["lat"],
        lon: json["lon"],
        clientId: json["clientId"],
        companyName: json["companyName"],
        cashBoxDetailsId: json["cashBoxDetailsId"],
        vatPayer: json["vatPayer"],
        calcItems: json["calcItems"] == null
            ? []
            : List<CalcItem>.from(
                json["calcItems"]!.map((x) => CalcItem.fromJson(x))),
        taxSystems: json["taxSystems"] == null
            ? []
            : List<TaxSystem>.from(
                json["taxSystems"]!.map((x) => TaxSystem.fromJson(x))),
        pauseStartDate: json["pauseStartDate"],
        pauseEndDate: json["pauseEndDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tin": tin,
        "rnm": rnm,
        "fm": fm,
        "addDate": addDate?.toIso8601String(),
        "endDate": endDate,
        "status": status,
        "cashBoxVersion": cashBoxVersion?.toJson(),
        "shopName": shopName,
        "businessActivity": businessActivity?.toJson(),
        "entrepreneurship": entrepreneurship?.toJson(),
        "sellPlace": sellPlace?.toJson(),
        "taxAuthDep": taxAuthDep?.toJson(),
        "index": index,
        "region": region,
        "city": city,
        "street": street,
        "homeNumber": homeNumber,
        "lat": lat,
        "lon": lon,
        "clientId": clientId,
        "companyName": companyName,
        "cashBoxDetailsId": cashBoxDetailsId,
        "vatPayer": vatPayer,
        "calcItems": calcItems == null
            ? []
            : List<dynamic>.from(calcItems!.map((x) => x.toJson())),
        "taxSystems": taxSystems == null
            ? []
            : List<dynamic>.from(taxSystems!.map((x) => x.toJson())),
        "pauseStartDate": pauseStartDate,
        "pauseEndDate": pauseEndDate,
      };
}

class BusinessActivity {
  final int? id;
  final String? name;
  final int? code;

  BusinessActivity({
    this.id,
    this.name,
    this.code,
  });

  BusinessActivity copyWith({
    int? id,
    String? name,
    int? code,
  }) =>
      BusinessActivity(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory BusinessActivity.fromJson(Map<String, dynamic> json) =>
      BusinessActivity(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class CalcItem {
  final int? id;
  final int? code;
  final int? version;
  final String? attributeName;
  final dynamic modifyDate;
  final int? baseCatalogueVersionId;

  CalcItem({
    this.id,
    this.code,
    this.version,
    this.attributeName,
    this.modifyDate,
    this.baseCatalogueVersionId,
  });

  CalcItem copyWith({
    int? id,
    int? code,
    int? version,
    String? attributeName,
    dynamic modifyDate,
    int? baseCatalogueVersionId,
  }) =>
      CalcItem(
        id: id ?? this.id,
        code: code ?? this.code,
        version: version ?? this.version,
        attributeName: attributeName ?? this.attributeName,
        modifyDate: modifyDate ?? this.modifyDate,
        baseCatalogueVersionId:
            baseCatalogueVersionId ?? this.baseCatalogueVersionId,
      );

  factory CalcItem.fromJson(Map<String, dynamic> json) => CalcItem(
        id: json["id"],
        code: json["code"],
        version: json["version"],
        attributeName: json["attributeName"],
        modifyDate: json["modifyDate"],
        baseCatalogueVersionId: json["baseCatalogueVersionId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "version": version,
        "attributeName": attributeName,
        "modifyDate": modifyDate,
        "baseCatalogueVersionId": baseCatalogueVersionId,
      };
}

class CashBoxVersion {
  final int? id;
  final String? definition;

  CashBoxVersion({
    this.id,
    this.definition,
  });

  CashBoxVersion copyWith({
    int? id,
    String? definition,
  }) =>
      CashBoxVersion(
        id: id ?? this.id,
        definition: definition ?? this.definition,
      );

  factory CashBoxVersion.fromJson(Map<String, dynamic> json) => CashBoxVersion(
        id: json["id"],
        definition: json["definition"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "definition": definition,
      };
}

class TaxSystem {
  final int? id;
  final int? code;
  final int? version;
  final String? taxName;
  final bool? vatPayer;
  final bool? vatNonPayer;
  final dynamic modifyDate;
  final int? baseCatalogueVersionId;

  TaxSystem({
    this.id,
    this.code,
    this.version,
    this.taxName,
    this.vatPayer,
    this.vatNonPayer,
    this.modifyDate,
    this.baseCatalogueVersionId,
  });

  TaxSystem copyWith({
    int? id,
    int? code,
    int? version,
    String? taxName,
    bool? vatPayer,
    bool? vatNonPayer,
    dynamic modifyDate,
    int? baseCatalogueVersionId,
  }) =>
      TaxSystem(
        id: id ?? this.id,
        code: code ?? this.code,
        version: version ?? this.version,
        taxName: taxName ?? this.taxName,
        vatPayer: vatPayer ?? this.vatPayer,
        vatNonPayer: vatNonPayer ?? this.vatNonPayer,
        modifyDate: modifyDate ?? this.modifyDate,
        baseCatalogueVersionId:
            baseCatalogueVersionId ?? this.baseCatalogueVersionId,
      );

  factory TaxSystem.fromJson(Map<String, dynamic> json) => TaxSystem(
        id: json["id"],
        code: json["code"],
        version: json["version"],
        taxName: json["taxName"],
        vatPayer: json["vatPayer"],
        vatNonPayer: json["vatNonPayer"],
        modifyDate: json["modifyDate"],
        baseCatalogueVersionId: json["baseCatalogueVersionId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "version": version,
        "taxName": taxName,
        "vatPayer": vatPayer,
        "vatNonPayer": vatNonPayer,
        "modifyDate": modifyDate,
        "baseCatalogueVersionId": baseCatalogueVersionId,
      };
}
