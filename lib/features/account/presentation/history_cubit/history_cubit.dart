import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/account/data/models/history_model.dart';
import 'package:ishker_24/features/account/data/models/history_request_model.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/server/catch_exception.dart';

part 'history_state.dart';

class QrHistoryCubit extends Cubit<QrHistoryState> {
  QrHistoryCubit({
    required HistoryUseCase historyUseCase,
    required String account,
  })  : _historyUseCase = historyUseCase,
        _account = account,
        super(QrHistoryState(
          start: DateTime.now().subtract(const Duration(days: 7)),
          end: DateTime.now(),
        ));

  final String _account;
  final HistoryUseCase _historyUseCase;

  void load({DateTime? start, DateTime? end, int page = 1}) async {
    log('QrHistoryCubit.load(state.model.pages: ${state.model.pages}, state.start: ${state.start}, state.end: ${state.end})');
    log('QrHistoryCubit.load(page: $page, start: $start, end: $end)');
    if (page == 1) {
      emit(QrHistoryState(start: start ?? state.start, end: end ?? state.end));
      await Future.delayed(Duration.zero);
    } else if (page > state.model.pages) {
      return;
    }

    emit(state.copyWith(status: RequestLoading()));

    try {
      final result = await _historyUseCase.call(HistoryRequestModel(
        account: _account,
        startDate: start ?? state.start,
        endDate: end ?? state.end,
        page: page,
      ));

      emit(state.copyWith(
        status: RequestSuccess(),
        currentPage: page,
        model: page == 1
            ? result
            : state.model.copyWith(
                items: {...state.model.items, ...result.items}.toList(),
              ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RequestFailure(CatchException.convertException(e)),
      ));
    }
  }
}
