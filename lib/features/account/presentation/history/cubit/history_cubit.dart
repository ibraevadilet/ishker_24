import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({
    required HistoryUseCase historyUseCase,
    required String account,
  })  : _historyUseCase = historyUseCase,
        _account = account,
        super(HistoryState(
          start: DateTime.now().subtract(const Duration(days: 7)),
          end: DateTime.now(),
        ));

  final String _account;
  final HistoryUseCase _historyUseCase;

  void load({DateTime? start, DateTime? end, int page = 1}) async {
    log('HistoryCubit.load(state.model.pages: ${state.model.pages}, state.start: ${state.start}, state.end: ${state.end})');
    log('HistoryCubit.load(page: $page, start: $start, end: $end)');
    if (page == 1) {
      emit(HistoryState(start: start ?? state.start, end: end ?? state.end));
      await Future.delayed(Duration.zero);
    } else if (page > state.model.pages) {
      return;
    }

    emit(state.copyWith(status: RequestLoading()));

    final result = await _historyUseCase.call(HistoryParams(
      account: _account,
      startDate: start ?? state.start,
      endDate: end ?? state.end,
      page: page,
    ));

    switch (result) {
      case Success():
        emit(state.copyWith(
          status: RequestSuccess(),
          currentPage: page,
          model: page == 1
              ? result.value
              : state.model.copyWith(
                  items: {...state.model.items, ...result.value.items}.toList(),
                ),
        ));
      case Failure():
        emit(state.copyWith(status: RequestFailure(result.exception)));
    }
  }
}
