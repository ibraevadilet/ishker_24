import 'dart:convert';

import 'package:flutter/foundation.dart';

MegaKassaStepsInfoEntity megaKassaStep1InfoEntityFromJson(String str) =>
    MegaKassaStepsInfoEntity.fromJson(json.decode(str));

String megaKassaStep1InfoEntityToJson(MegaKassaStepsInfoEntity data) =>
    json.encode(data.toJson());

class MegaKassaStepsInfoEntity {
  final List<Activity>? activities;
  final List<Activity>? authorityDeps;
  final List<CalcItem>? calcItems;
  final List<Activity>? entrepreneurshipObjects;
  final List<Activity>? sellPlaces;
  final List<TaxSystem>? taxSystems;
  final List<Model>? models;

  MegaKassaStepsInfoEntity({
    this.activities,
    this.authorityDeps,
    this.calcItems,
    this.entrepreneurshipObjects,
    this.sellPlaces,
    this.taxSystems,
    this.models,
  });

  MegaKassaStepsInfoEntity copyWith({
    List<Activity>? activities,
    List<Activity>? authorityDeps,
    List<CalcItem>? calcItems,
    List<Activity>? entrepreneurshipObjects,
    List<Activity>? sellPlaces,
    List<TaxSystem>? taxSystems,
    List<Model>? models,
  }) =>
      MegaKassaStepsInfoEntity(
        activities: activities ?? this.activities,
        authorityDeps: authorityDeps ?? this.authorityDeps,
        calcItems: calcItems ?? this.calcItems,
        entrepreneurshipObjects:
            entrepreneurshipObjects ?? this.entrepreneurshipObjects,
        sellPlaces: sellPlaces ?? this.sellPlaces,
        taxSystems: taxSystems ?? this.taxSystems,
        models: models ?? this.models,
      );

  factory MegaKassaStepsInfoEntity.fromJson(Map<String, dynamic> json) =>
      MegaKassaStepsInfoEntity(
        activities: json["activities"] == null
            ? []
            : List<Activity>.from(
                json["activities"]!.map((x) => Activity.fromJson(x))),
        authorityDeps: json["authorityDeps"] == null
            ? []
            : List<Activity>.from(
                json["authorityDeps"]!.map((x) => Activity.fromJson(x))),
        calcItems: json["calcItems"] == null
            ? []
            : List<CalcItem>.from(
                json["calcItems"]!.map((x) => CalcItem.fromJson(x))),
        entrepreneurshipObjects: json["entrepreneurshipObjects"] == null
            ? []
            : List<Activity>.from(json["entrepreneurshipObjects"]!
                .map((x) => Activity.fromJson(x))),
        sellPlaces: json["sellPlaces"] == null
            ? []
            : List<Activity>.from(
                json["sellPlaces"]!.map((x) => Activity.fromJson(x))),
        taxSystems: json["taxSystems"] == null
            ? []
            : List<TaxSystem>.from(
                json["taxSystems"]!.map((x) => TaxSystem.fromJson(x))),
        models: json["models"] == null
            ? []
            : List<Model>.from(json["models"]!.map((x) => Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "authorityDeps": authorityDeps == null
            ? []
            : List<dynamic>.from(authorityDeps!.map((x) => x.toJson())),
        "calcItems": calcItems == null
            ? []
            : List<dynamic>.from(calcItems!.map((x) => x.toJson())),
        "entrepreneurshipObjects": entrepreneurshipObjects == null
            ? []
            : List<dynamic>.from(
                entrepreneurshipObjects!.map((x) => x.toJson())),
        "sellPlaces": sellPlaces == null
            ? []
            : List<dynamic>.from(sellPlaces!.map((x) => x.toJson())),
        "taxSystems": taxSystems == null
            ? []
            : List<dynamic>.from(taxSystems!.map((x) => x.toJson())),
        "models": models == null
            ? []
            : List<dynamic>.from(models!.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaStepsInfoEntity &&
        listEquals(other.activities, activities) &&
        listEquals(other.authorityDeps, authorityDeps) &&
        listEquals(other.calcItems, calcItems) &&
        listEquals(other.entrepreneurshipObjects, entrepreneurshipObjects) &&
        listEquals(other.sellPlaces, sellPlaces) &&
        listEquals(other.taxSystems, taxSystems) &&
        listEquals(other.models, models);
  }

  @override
  int get hashCode {
    return activities.hashCode ^
        authorityDeps.hashCode ^
        calcItems.hashCode ^
        entrepreneurshipObjects.hashCode ^
        sellPlaces.hashCode ^
        taxSystems.hashCode ^
        models.hashCode;
  }
}

class Activity {
  final int? id;
  final String? name;
  final int? code;

  Activity({
    this.id,
    this.name,
    this.code,
  });

  Activity copyWith({
    int? id,
    String? name,
    int? code,
  }) =>
      Activity(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.id == id &&
        other.name == name &&
        other.code == code;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ code.hashCode;
}

class Model {
  final int? id;
  final String? definition;

  Model({
    this.id,
    this.definition,
  });

  Activity copyWith({
    int? id,
    String? definition,
  }) =>
      Activity(
        id: id ?? this.id,
        name: definition ?? this.definition,
      );

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        definition: json["definition"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "definition": definition,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model && other.id == id && other.definition == definition;
  }

  @override
  int get hashCode => id.hashCode ^ definition.hashCode;
}

class CalcItem {
  final int? id;
  final int? code;
  final int? version;
  final String? attributeName;
  final DateTime? modifyDate;
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
    DateTime? modifyDate,
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
        modifyDate: json["modifyDate"] == null
            ? null
            : DateTime.parse(json["modifyDate"]),
        baseCatalogueVersionId: json["baseCatalogueVersionId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "version": version,
        "attributeName": attributeName,
        "modifyDate": modifyDate?.toIso8601String(),
        "baseCatalogueVersionId": baseCatalogueVersionId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalcItem &&
        other.id == id &&
        other.code == code &&
        other.version == version &&
        other.attributeName == attributeName &&
        other.modifyDate == modifyDate &&
        other.baseCatalogueVersionId == baseCatalogueVersionId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        version.hashCode ^
        attributeName.hashCode ^
        modifyDate.hashCode ^
        baseCatalogueVersionId.hashCode;
  }
}

class TaxSystem {
  final int? id;
  final int? code;
  final int? version;
  final String? taxName;
  final bool? vatPayer;
  final bool? vatNonPayer;
  final DateTime? modifyDate;
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
    DateTime? modifyDate,
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
        modifyDate: json["modifyDate"] == null
            ? null
            : DateTime.parse(json["modifyDate"]),
        baseCatalogueVersionId: json["baseCatalogueVersionId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "version": version,
        "taxName": taxName,
        "vatPayer": vatPayer,
        "vatNonPayer": vatNonPayer,
        "modifyDate": modifyDate?.toIso8601String(),
        "baseCatalogueVersionId": baseCatalogueVersionId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaxSystem &&
        other.id == id &&
        other.code == code &&
        other.version == version &&
        other.taxName == taxName &&
        other.vatPayer == vatPayer &&
        other.vatNonPayer == vatNonPayer &&
        other.modifyDate == modifyDate &&
        other.baseCatalogueVersionId == baseCatalogueVersionId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        version.hashCode ^
        taxName.hashCode ^
        vatPayer.hashCode ^
        vatNonPayer.hashCode ^
        modifyDate.hashCode ^
        baseCatalogueVersionId.hashCode;
  }
}
