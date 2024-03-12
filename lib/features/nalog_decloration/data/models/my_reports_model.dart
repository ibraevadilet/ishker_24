class ReportDoneModel {
  final int reportId;
  final String reportName;
  final String status;
  final String period;
  final String formType;
  final String sendDate;

  ReportDoneModel({
    required this.reportId,
    required this.reportName,
    required this.status,
    required this.period,
    required this.formType,
    required this.sendDate,
  });

  factory ReportDoneModel.fromJson(Map<String, dynamic> json) =>
      ReportDoneModel(
        reportId: json["reportId"],
        reportName: json["reportName"],
        status: json["status"],
        period: json["period"] ?? '',
        formType: json["formType"] ?? '',
        sendDate: json["sendDate"],
      );
}
