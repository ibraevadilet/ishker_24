class TaxAndSelectedModesModels {
  final List<TaxModel> nalogTypes;
  final List<TaxModel> ediniyNalog;
  final List<TaxModel> vidDeatelnosti;
  TaxAndSelectedModesModels({
    this.nalogTypes = const [],
    this.ediniyNalog = const [],
    this.vidDeatelnosti = const [],
  });

  factory TaxAndSelectedModesModels.fromJson(List<dynamic> map) {
    return TaxAndSelectedModesModels(
      nalogTypes: map[0].map<TaxModel>((e) => TaxModel.fromJson(e)).toList(),
      ediniyNalog: map[1].map<TaxModel>((e) => TaxModel.fromJson(e)).toList(),
      vidDeatelnosti:
          map[2].map<TaxModel>((e) => TaxModel.fromJson(e)).toList(),
    );
  }
}

class TaxModel {
  final String id;
  final String text;

  TaxModel({
    required this.id,
    required this.text,
  });

  factory TaxModel.fromJson(Map<String, dynamic> json) => TaxModel(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
