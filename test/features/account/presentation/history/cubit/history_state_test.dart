import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';

import '../../../../../utils/constants.dart';

void main() {
  final now = DateTime.now();
  final initialState = HistoryState(start: now.days7, end: now);
  final state = HistoryState(
    status: RequestSuccess(),
    model: tHistory,
    currentPage: 2,
    start: now.days7,
    end: now,
  );

  test(
    'HistoryState props are correct',
    () => expect(
      initialState.props,
      equals(<Object?>[
        const RequestInitial(),
        History.empty,
        1,
        now.days7,
        now,
      ]),
    ),
  );

  group('HistoryState.copyWith()', () {
    test(
      'returns the same object if not arguments are provided',
      () => expect(initialState.copyWith(), equals(initialState)),
    );

    test(
      'retains the old value for every parameter if null is provided',
      () => expect(
        initialState.copyWith(status: null, start: null, end: null),
        equals(initialState),
      ),
    );

    test(
      'replaces non-null parameter',
      () => expect(
        initialState.copyWith(
          status: RequestSuccess(),
          model: tHistory,
          currentPage: 2,
          start: now.days7,
          end: now,
        ),
        equals(state),
      ),
    );
  });
}
