import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/features/rsk/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/rsk/account/presentation/info/widgets/account_card_widget.dart';
import 'package:ishker_24/widgets/icon_title_button.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/ui_test_helper.dart';

void main() {
  late MockAccountInfoCubit infoCubit;

  setUp(() async => infoCubit = MockAccountInfoCubit());

  group('AccountCardWidget when AccountInfoCubit\'s state is', () {
    final accountCard = BlocProvider<AccountInfoCubit>(
      create: (_) => infoCubit,
      child: Scaffold(body: AccountCardWidget(account: tAccount.account)),
    );

    group('AccountInfoInitial', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoInitial()),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoInitial());
      });

      testWidgets('should draw a shimmer', (tester) async {
        await pumpWidget(tester, accountCard);
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
        await pumpWidget(tester, accountCard);
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
        'should draw a Container with amount and account number RichTexts',
        (tester) async {
          await pumpWidget(tester, accountCard);
          await tester.pump();
          expect(
            find.text(
              '${AppCurrencyFormatter.currencyCash(tAccount.amount)} ${AppCurrencyFormatter.cuccancyType(tAccount.currency)}',
              findRichText: true,
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              '\u00b7\u00b7${tAccount.account.substring(tAccount.account.length - 4)}',
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
        'should draw a Container with account number RichText',
        (tester) async {
          await pumpWidget(tester, accountCard);
          await tester.pump();

          expect(
            find.text(
              '\u00b7\u00b7${tAccount.account.substring(tAccount.account.length - 4)}',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );
    });
  });

  group('AccountActionButtons when AccountInfoCubit\'s state', () {
    final accountButtons = BlocProvider<AccountInfoCubit>(
      create: (_) => infoCubit,
      child: Scaffold(body: AccountActionButtons(account: tAccount.account)),
    );

    group('AccountInfoInitial', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoInitial()),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoInitial());
      });

      testWidgets(
        'should draw 4 IconTitleButtonShimmer widgets and their labels',
        (tester) async {
          await pumpWidget(tester, accountButtons);
          await tester.pump();

          expect(find.byType(IconTitleButtonShimmer), findsNWidgets(4));
          expect(find.text('pay'.tr()), findsOneWidget);
          expect(find.text('refill'.tr()), findsOneWidget);
          expect(find.text('toTransfer'.tr()), findsOneWidget);
          expect(find.text('requisites'.tr()), findsOneWidget);
        },
      );
    });

    group('AccountInfoLoading', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoLoading()),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoLoading());
      });

      testWidgets(
        'should draw 4 IconTitleButtonShimmer widgets and their labels',
        (tester) async {
          await pumpWidget(tester, accountButtons);
          await tester.pump();

          expect(find.byType(IconTitleButtonShimmer), findsNWidgets(4));
          expect(find.text('pay'.tr()), findsOneWidget);
          expect(find.text('refill'.tr()), findsOneWidget);
          expect(find.text('toTransfer'.tr()), findsOneWidget);
          expect(find.text('requisites'.tr()), findsOneWidget);
        },
      );
    });

    group('AccountInfoSuccess & AccountInfoFailure', () {
      setUp(() {
        when(() => infoCubit.stream).thenAnswer(
          (_) => Stream<AccountInfoState>.value(AccountInfoSuccess(tAccount)),
        );
        when(() => infoCubit.state).thenReturn(AccountInfoSuccess(tAccount));
      });

      testWidgets(
        'should draw 4 IconTitleButton widgets and their labels',
        (tester) async {
          await pumpWidget(tester, accountButtons);
          await tester.pump();

          expect(find.byType(IconTitleButton), findsNWidgets(4));
          expect(find.text('pay'.tr()), findsOneWidget);
          expect(find.text('refill'.tr()), findsOneWidget);
          expect(find.text('toTransfer'.tr()), findsOneWidget);
          expect(find.text('requisites'.tr()), findsOneWidget);
        },
      );

      testWidgets(
        'tap on Requisites should draw requisites info on bottom sheet',
        (tester) async {
          await pumpWidget(tester, accountButtons);
          await tester.pump();

          expect(find.text('requisites'.tr()), findsOneWidget);
          expect(find.text('accountNumber'.tr()), findsNothing);
          expect(find.text(tAccount.account), findsNothing);
          expect(find.text('recipientBank'.tr()), findsNothing);
          expect(find.text(tAccount.depname), findsNothing);
          expect(find.text('bic'.tr()), findsNothing);
          expect(find.text(tAccount.bic), findsNothing);
          expect(find.text('branch'.tr()), findsNothing);
          expect(find.text(tAccount.address), findsNothing);

          const key = ValueKey('account_card_requisites_key');
          final btn = find.byKey(key, skipOffstage: false);
          await tester.ensureVisible(btn);
          await tester.tap(btn);
          await tester.pumpAndSettle();
          expect(
            find.text('requisites'.tr(), skipOffstage: false),
            findsNWidgets(2),
          );
          expect(find.text('accountNumber'.tr()), findsOneWidget);
          expect(find.text(tAccount.account), findsOneWidget);
          expect(find.text('recipientBank'.tr()), findsOneWidget);
          expect(find.text(tAccount.depname), findsOneWidget);
          expect(find.text('bic'.tr()), findsOneWidget);
          expect(find.text(tAccount.bic), findsOneWidget);
          expect(find.text('branch'.tr()), findsOneWidget);
          expect(find.text(tAccount.address), findsOneWidget);
        },
      );
    });
  });
}
