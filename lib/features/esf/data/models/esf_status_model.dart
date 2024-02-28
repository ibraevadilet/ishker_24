class EsfStatusModel {
  final List<Content> content;

  EsfStatusModel({
    required this.content,
  });

  factory EsfStatusModel.fromJson(Map<String, dynamic> json) => EsfStatusModel(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "content": List<dynamic>.from(content.map((x) => x.toMap())),
      };
}

class Content {
  final int id;
  final String name;
  final String fullName;

  Content({
    required this.id,
    required this.name,
    required this.fullName,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "fullName": fullName,
      };
}

