import 'dart:convert';

class EsfAcceptOrRejectModel {
    final String responseId;
    final List<AffectedDocument> affectedDocuments;

    EsfAcceptOrRejectModel({
        required this.responseId,
        required this.affectedDocuments,
    });

    factory EsfAcceptOrRejectModel.fromJson(String str) => EsfAcceptOrRejectModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EsfAcceptOrRejectModel.fromMap(Map<String, dynamic> json) => EsfAcceptOrRejectModel(
        responseId: json["responseId"],
        affectedDocuments: List<AffectedDocument>.from(json["affectedDocuments"].map((x) => AffectedDocument.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "responseId": responseId,
        "affectedDocuments": List<dynamic>.from(affectedDocuments.map((x) => x.toMap())),
    };
}

class AffectedDocument {
    final String documentUuid;
    final NewStatus newStatus;

    AffectedDocument({
        required this.documentUuid,
        required this.newStatus,
    });

    factory AffectedDocument.fromJson(String str) => AffectedDocument.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AffectedDocument.fromMap(Map<String, dynamic> json) => AffectedDocument(
        documentUuid: json["documentUuid"],
        newStatus: NewStatus.fromMap(json["newStatus"]),
    );

    Map<String, dynamic> toMap() => {
        "documentUuid": documentUuid,
        "newStatus": newStatus.toMap(),
    };
}

class NewStatus {
    final String code;
    final String name;

    NewStatus({
        required this.code,
        required this.name,
    });

    factory NewStatus.fromJson(String str) => NewStatus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewStatus.fromMap(Map<String, dynamic> json) => NewStatus(
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
    };
}
