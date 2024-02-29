class UgnsModel {
  final String id;
  final String displayText;
  final String displayTextWithCode;

  UgnsModel({
    required this.id,
    required this.displayText,
    required this.displayTextWithCode,
  });

  factory UgnsModel.fromJson(Map<String, dynamic> json) => UgnsModel(
        id: json["id"],
        displayText: json["displayText"],
        displayTextWithCode: json["displayTextWithCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayText": displayText,
        "displayTextWithCode": displayTextWithCode,
      };
}
