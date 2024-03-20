import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/features/rsk/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/rsk/account/presentation/info/widgets/amount_unfree_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/ui_test_helper.dart';

void main() {
  late MockAccountInfoCubit infoCubit;

  setUp(() async => infoCubit = MockAccountInfoCubit());

  group('AmountUnfreeWidget when AccountInfoCubit\'s state is', () {
    final amountUnfreeWidget = BlocProvider<AccountInfoCubit>(
      create: (_) => infoCubit,
      child: const Scaffold(body: AmountUnfreeWidget()),
    );

    group('AccountInfoInitial', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoInitial()),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoInitial());
      });

      testWidgets('should draw a shimmer', (tester) async {
        await pumpWidget(tester, amountUnfreeWidget);
        await tester.pump();
        expect(find.byType(Shimmer), findsOneWidget);
      });
    });

    group('AccountInfoLoading', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoLoading()),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoLoading());
      });

      testWidgets('should draw a shimmer', (tester) async {
        await pumpWidget(tester, amountUnfreeWidget);
        await tester.pump();
        expect(find.byType(Shimmer), findsOneWidget);
      });
    });

    group('AccountInfoSuccess', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoSuccess(tAccount)),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoSuccess(tAccount));
      });

      testWidgets(
        'should draw a ListTile with unfree amount RichText',
        (tester) async {
          await pumpWidget(tester, amountUnfreeWidget);
          await tester.pump();
          expect(
            find.text(
              '${AppCurrencyFormatter.currencyCash(tAccount.amountUnfree)} ${AppCurrencyFormatter.cuccancyType(tAccount.currency)}',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );
    });

    group('AccountInfoFailure', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(
            AccountInfoFailure(tDioException),
          ),
        );
        when(() => infoCubit.state).thenReturn(
          AccountInfoFailure(tDioException),
        );
      });

      testWidgets(
        'should hide amount unfree widget',
        (tester) async {
          await pumpWidget(tester, amountUnfreeWidget);
          await tester.pump();

          expect(find.byType(RichText), findsNothing);
        },
      );
    });
  });
}
