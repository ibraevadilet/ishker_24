class NalogNameModel {
  final String name;
  final String reportType;

  NalogNameModel({
    required this.name,
    required this.reportType,
  });

  factory NalogNameModel.fromJson(Map<String, dynamic> json) => NalogNameModel(
        name: json["name"],
        reportType: json["reportType"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "reportType": reportType,
      };
}
