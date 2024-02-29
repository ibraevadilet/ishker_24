class ReportDoneModel {
  final int reportId;
  final String reportName;
  final String status;
  final DateTime sendDate;

  ReportDoneModel({
    required this.reportId,
    required this.reportName,
    required this.status,
    required this.sendDate,
  });

  factory ReportDoneModel.fromJson(Map<String, dynamic> json) =>
      ReportDoneModel(
        reportId: json["reportId"],
        reportName: json["reportName"],
        status: json["status"],
        sendDate: DateTime.parse(json["sendDate"]),
      );

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "reportName": reportName,
        "status": status,
        "sendDate": sendDate.toIso8601String(),
      };
}
