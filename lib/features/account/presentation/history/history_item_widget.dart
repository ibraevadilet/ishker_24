import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_listtile.dart';
import 'package:ishker_24/widgets/detail_row.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.item});

  final HistoryItem item;

  void showDetailsModal(BuildContext context) {
    showSheet(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'historyDetails'.tr(context: context),
              style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(
                    title: 'sum'.tr(context: context),
                    value:
                        '${AppCurrencyFormatter.currencyCash(item.amount)} C',
                  ),
                  DetailRow(
                    title: 'operation'.tr(context: context),
                    value: item.isPrihod
                        ? 'prihod'.tr(context: context)
                        : 'rashod'.tr(context: context),
                  ),
                  DetailRow(
                    title: item.isPrihod
                        ? 'toAccount'.tr(context: context)
                        : 'fromAccount'.tr(context: context),
                    value: item.receiverAccount,
                  ),
                  DetailRow(
                    title: 'sendDate'.tr(context: context),
                    value: AppDateFormats.formatDdMMYyyy.format(item.paydate),
                  ),
                  DetailRow(
                    title: item.isPrihod
                        ? 'prihodDate'.tr(context: context)
                        : 'rashodDate'.tr(context: context),
                    value: AppDateFormats.formatDdMMYyyy.format(item.trandate),
                  ),
                  DetailRow(
                    title: 'sender'.tr(context: context),
                    value: item.payerName,
                  ),
                  DetailRow(
                    title: item.isPrihod
                        ? 'senderBank'.tr(context: context)
                        : 'recieverBank'.tr(context: context),
                    value: item.payerBankname,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: CustomListTile(
        ontap: () => showDetailsModal(context),
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '№${item.receiverAccount}',
              style: AppTextStyles.s15W600(color: AppColors.color2C2C2CBlack),
            ),
            Text(
              AppDateFormats.formatDdMMYyyy.format(item.trandate),
              style: AppTextStyles.s12W400(
                color: AppColors.color2C2C2CBlack,
              ),
            )
          ],
        ),
        trailingWidget: RichText(
          text: TextSpan(
            text:
                '${item.isPrihod ? '+' : '-'}${AppCurrencyFormatter.currencyCash(item.amount)} ',
            style: AppTextStyles.s16W700(
              color: item.isPrihod
                  ? AppColors.color54B25AMain
                  : AppColors.color2C2C2CBlack,
            ),
            children: [
              TextSpan(
                text: AppCurrencyFormatter.cuccancyType(item.currency),
                style: AppTextStyles.s16W700(
                  color: item.isPrihod
                      ? AppColors.color54B25AMain
                      : AppColors.color2C2C2CBlack,
                ).copyWith(decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
