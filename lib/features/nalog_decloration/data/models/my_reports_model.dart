class ReportDoneModel {
  final int reportId;
  final String reportName;
  final String status;
  final String period;
  final String formType;
  final String sendDate;
  final List<String> reason;

  ReportDoneModel({
    required this.reportId,
    required this.reportName,
    required this.status,
    required this.period,
    required this.formType,
    required this.sendDate,
    this.reason = const [],
  });

  factory ReportDoneModel.fromJson(Map<String, dynamic> json) =>
      ReportDoneModel(
        reportId: json["reportId"],
        reportName: json["reportName"],
        status: json["status"],
        period: json["period"] ?? '',
        formType: json["formType"] ?? '',
        sendDate: json["sendDate"],
        reason: json['reason'] != null
            ? json['reason'].map<String>((e) => e.toString()).toList()
            : [],
      );
}
