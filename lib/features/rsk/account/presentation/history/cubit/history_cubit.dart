import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/history.dart';
import 'package:ishker_24/features/rsk/account/domain/usecases/history_usecase.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({
    required HistoryUseCase historyUseCase,
    required String account,
  })  : _historyUseCase = historyUseCase,
        _account = account,
        super(HistoryState(
          start: DateTime.now().days7,
          end: DateTime.now(),
        ));

  final String _account;
  final HistoryUseCase _historyUseCase;

  void load({DateTime? start, DateTime? end}) async {
    emit(HistoryState(start: start ?? state.start, end: end ?? state.end));
    await Future.delayed(Duration.zero);

    emit(state.copyWith(status: RequestLoading()));

    final result = await _historyUseCase.call(HistoryParams(
      account: _account,
      startDate: start ?? state.start,
      endDate: end ?? state.end,
      page: 1,
    ));

    emit(switch (result) {
      Success() => state.copyWith(
          status: RequestSuccess(),
          model: result.value,
        ),
      Failure() => state.copyWith(status: RequestFailure(result.exception)),
    });
  }

  void next() async {
    final nextPage = state.currentPage + 1;
    if (nextPage > state.model.pages) return;

    emit(state.copyWith(status: RequestLoading()));

    final result = await _historyUseCase.call(HistoryParams(
      account: _account,
      startDate: state.start,
      endDate: state.end,
      page: nextPage,
    ));

    switch (result) {
      case Success():
        emit(state.copyWith(
          status: RequestSuccess(),
          currentPage: nextPage,
          model: result.value.copyWith(
            items: {...state.model.items, ...result.value.items}.toList(),
          ),
        ));
      case Failure():
        emit(state.copyWith(status: RequestFailure(result.exception)));
    }
  }
}
