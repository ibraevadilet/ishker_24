import 'package:equatable/equatable.dart';

class HistoryRequestModel extends Equatable {
  const HistoryRequestModel({
    required this.account,
    required this.startDate,
    required this.endDate,
    this.page = 1,
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

  @override
  List<Object?> get props => [account, startDate, endDate, page, size];
}
