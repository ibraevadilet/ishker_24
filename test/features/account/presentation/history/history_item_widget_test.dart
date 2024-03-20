import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/history_item_widget.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/ui_test_helper.dart';

void main() {
  final widget = Scaffold(body: HistoryItemWidget(item: tHistoryItem));

  testWidgets(
    'HistoryItemWidget should draw HistoryItem account & amount data',
    (tester) async {
      await pumpWidget(tester, widget);
      await tester.pumpAndSettle();

      expect(find.text('№${tHistoryItem.receiverAccount}'), findsOneWidget);
      expect(
        find.text(
          '${tHistoryItem.isPrihod ? '+' : '-'}${AppCurrencyFormatter.currencyCash(tHistoryItem.amount)} ${AppCurrencyFormatter.cuccancyType(tHistoryItem.currency)}',
          findRichText: true,
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'HistoryItemWidget tap should draw history details on modal sheet',
    (tester) async {
      await pumpWidget(tester, widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      final context = getContext(tester, Scaffold);

      expect(find.text('historyDetails'.tr(context: context)), findsOneWidget);
      expect(find.text('sum'.tr(context: context)), findsOneWidget);
      expect(
        find.text(
            '${AppCurrencyFormatter.currencyCash(tHistoryItem.amount)} C'),
        findsOneWidget,
      );
      expect(find.text('operation'.tr(context: context)), findsOneWidget);
      expect(find.text('prihod'.tr(context: context)), findsOneWidget);
      expect(find.text('rashod'.tr(context: context)), findsNothing);
      expect(find.text('toAccount'.tr(context: context)), findsOneWidget);
      expect(find.text('fromAccount'.tr(context: context)), findsNothing);
      expect(find.text(tHistoryItem.receiverAccount), findsOneWidget);
      expect(find.text('sendDate'.tr(context: context)), findsOneWidget);
      expect(
        find.text(AppDateFormats.formatDdMMYyyy.format(tHistoryItem.paydate)),
        findsNWidgets(3), //1 - listtile, 2 - paydate, 3 - trandate
      );
      expect(find.text('prihodDate'.tr(context: context)), findsOneWidget);
      expect(find.text('rashodDate'.tr(context: context)), findsNothing);
      expect(find.text('sender'.tr(context: context)), findsOneWidget);
      expect(find.text(tHistoryItem.payerName), findsOneWidget);
      expect(find.text('senderBank'.tr(context: context)), findsOneWidget);
      expect(find.text('recieverBank'.tr(context: context)), findsNothing);
      expect(find.text(tHistoryItem.payerBankname), findsOneWidget);
    },
  );
}
