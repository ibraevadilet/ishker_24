class ReportDoneModel {
  final int reportId;
  final String reportName;
  final String status;
  final String sendDate;

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
        sendDate: json["sendDate"],
      );

  Map<String, dynamic> toJson() => {
        "reportId": reportId,
        "reportName": reportName,
        "status": status,
        "sendDate": sendDate,
      };
}
