import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/history.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/history_item_widget.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/history_screen.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/ui_test_helper.dart';

void main() {
  late MockHistoryCubit cubit;
  final now = DateTime.now();

  setUp(() {
    cubit = MockHistoryCubit();
  });
// when(() => cubit.stream).thenAnswer(
//         (_) => Stream<HistoryState>.value(HistoryState(
//           status: RequestSuccess(),
//           model: tHistory,
//           currentPage: 1,
//           start: now.days7,
//           end: now,
//         )),
//       );
  group('HistoryScreen', () {
    final state = HistoryState(
      start: now.days7,
      end: now,
      status: RequestLoading(),
    );

    setUp(() {
      when(() => cubit.stream).thenAnswer(
        (_) => Stream<HistoryState>.value(state),
      );
      when(() => cubit.state).thenReturn(state);
    });

    testWidgets(
      'should draw AppIndicator while HistoryState.status is RequestLoading',
      (tester) async {
        await pumpWidget(
          tester,
          BlocProvider<HistoryCubit>(
            create: (_) => cubit,
            child: const HistoryView(),
          ),
        );
        await tester.pump();

        expect(find.byType(AppIndicator), findsOneWidget);
      },
    );
  });

  group('HistoryScreen while HistoryState.status is RequestSuccess', () {
    final state = HistoryState(
      start: now.days7,
      end: now,
      status: RequestSuccess(),
      model: tHistory,
    );

    setUp(() {
      when(() => cubit.stream).thenAnswer(
        (_) => Stream<HistoryState>.value(state),
      );
      when(() => cubit.state).thenReturn(state);
    });

    testWidgets(
      'should draw ListView of HistoryItemWidgets',
      (tester) async {
        await pumpWidget(
          tester,
          BlocProvider<HistoryCubit>(
            create: (_) => cubit,
            child: const HistoryView(),
          ),
        );
        await tester.pump();

        expect(find.byType(ListView), findsOneWidget);
        expect(
          find.byType(HistoryItemWidget),
          findsNWidgets(tHistory.items.length),
        );
      },
    );
  });

  group(
      'HistoryScreen while HistoryState.status is RequestSuccess but list is empty',
      () {
    final state = HistoryState(
      start: now.days7,
      end: now,
      status: RequestSuccess(),
      model: History.empty,
    );

    setUp(() {
      when(() => cubit.stream).thenAnswer(
        (_) => Stream<HistoryState>.value(state),
      );
      when(() => cubit.state).thenReturn(state);
    });

    testWidgets(
      'should draw an empty widget while list of items is empty',
      (tester) async {
        await pumpWidget(
          tester,
          BlocProvider<HistoryCubit>(
            create: (_) => cubit,
            child: const HistoryView(),
          ),
        );
        await tester.pump();

        expect(find.text('operationsEmpty'.tr()), findsOneWidget);
        expect(find.text('operationsEmptyMsg'.tr()), findsOneWidget);
      },
    );
  });
}
