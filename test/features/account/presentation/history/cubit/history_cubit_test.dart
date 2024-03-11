import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/constants.dart';

void main() {
  late MockHistoryUseCase useCase;
  late HistoryCubit cubit;

  setUp(() {
    useCase = MockHistoryUseCase();
    cubit = HistoryCubit(historyUseCase: useCase, account: tAccount.account);
  });

  group('HistoryCubit.load()', () {
    final state = HistoryState(
      start: tHistoryParams.startDate,
      end: tHistoryParams.endDate,
    );

    blocTest<HistoryCubit, HistoryState>(
      'success',
      build: () => cubit,
      setUp: () => when(() => useCase.call(tHistoryParams)).thenAnswer(
        (_) async => Success(tHistory),
      ),
      act: (bloc) => bloc.load(
        start: tHistoryParams.startDate,
        end: tHistoryParams.endDate,
      ),
      expect: () => [
        state,
        state.copyWith(status: RequestLoading()),
        state.copyWith(
          status: RequestSuccess(),
          currentPage: 1,
          model: tHistory,
        ),
      ],
      verify: (bloc) {
        verify(() => useCase.call(tHistoryParams)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );

    blocTest<HistoryCubit, HistoryState>(
      'failure',
      build: () => cubit,
      setUp: () => when(() => useCase.call(tHistoryParams)).thenAnswer(
        (_) async => Failure(tDioException),
      ),
      act: (bloc) => bloc.load(
        start: tHistoryParams.startDate,
        end: tHistoryParams.endDate,
      ),
      expect: () => [
        state,
        state.copyWith(status: RequestLoading()),
        state.copyWith(status: RequestFailure(tDioException)),
      ],
      verify: (bloc) {
        verify(() => useCase.call(tHistoryParams)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );
  });

  group('HistoryCubit.next()', () {
    final history = tHistory.copyWith(pages: 2);

    final state = HistoryState(
      start: tHistoryParams.startDate,
      end: tHistoryParams.endDate,
      status: RequestSuccess(),
      model: history,
      currentPage: 1,
    );

    final nParams = HistoryParams(
      account: tAccount.account,
      startDate: tHistoryParams.startDate,
      endDate: tHistoryParams.endDate,
      page: 2,
    );

    blocTest<HistoryCubit, HistoryState>(
      'success',
      build: () => cubit,
      setUp: () => when(() => useCase.call(nParams)).thenAnswer(
        (_) async => Success(history),
      ),
      seed: () => state,
      act: (bloc) => bloc.next(),
      expect: () => [
        state.copyWith(status: RequestLoading()),
        state.copyWith(
          status: RequestSuccess(),
          currentPage: 2,
          model: history,
        ),
      ],
      verify: (bloc) {
        verify(() => useCase.call(nParams)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );

    blocTest<HistoryCubit, HistoryState>(
      'do not fetch data if page > total pages',
      build: () => cubit,
      seed: () => state.copyWith(model: tHistory),
      act: (bloc) => bloc.next(),
      expect: () => [],
      verify: (bloc) => verifyNever(() => useCase.call(nParams)),
    );

    blocTest<HistoryCubit, HistoryState>(
      'failure',
      build: () => cubit,
      setUp: () => when(() => useCase.call(nParams)).thenAnswer(
        (_) async => Failure(tDioException),
      ),
      seed: () => state,
      act: (bloc) => bloc.next(),
      expect: () => [
        state.copyWith(status: RequestLoading()),
        state.copyWith(status: RequestFailure(tDioException)),
      ],
      verify: (bloc) {
        verify(() => useCase.call(nParams)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );
  });
}
