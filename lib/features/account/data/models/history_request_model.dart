class HistoryRequestModel {
  HistoryRequestModel({
    required this.account,
    required this.startDate,
    required this.endDate,
    this.page = 0,
    this.size = 10,
  });

  final String account;
  final DateTime startDate;
  final DateTime endDate;
  final int page;
  final int size;

  Map<String, dynamic> toJson() => {
        "account": account,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "page": page,
        "size": size
      };
}
