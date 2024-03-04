part of 'history_cubit.dart';

class HistoryState extends Equatable {
  const HistoryState({
    this.status = const RequestInitial(),
    this.model = HistoryModel.empty,
    this.currentPage = 1,
    required this.start,
    required this.end,
  });

  final RequestStatus status;
  final HistoryModel model;
  final int currentPage;
  final DateTime start;
  final DateTime end;

  HistoryState copyWith({
    RequestStatus? status,
    HistoryModel? model,
    int? currentPage,
    DateTime? start,
    DateTime? end,
  }) =>
      HistoryState(
        status: status ?? this.status,
        model: model ?? this.model,
        currentPage: currentPage ?? this.currentPage,
        start: start ?? this.start,
        end: end ?? this.end,
      );

  @override
  List<Object?> get props => [status, model, currentPage, start, end];
}
