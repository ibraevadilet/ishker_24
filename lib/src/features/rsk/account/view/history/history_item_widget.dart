import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/src/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/src/core/formatters/date_format.dart';
import 'package:ishker_24/src/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/src/features/rsk/account/domain/entities/history.dart';
import 'package:ishker_24/src/features/widgets/custom_listtile.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.item});

  final HistoryItem item;

  Widget detailRow(String title, String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );

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
                  detailRow(
                    'sum'.tr(context: context),
                    '${AppCurrencyFormatter.currencyCash(item.amount)} C',
                  ),
                  detailRow(
                    'operation'.tr(context: context),
                    item.isPrihod
                        ? 'prihod'.tr(context: context)
                        : 'rashod'.tr(context: context),
                  ),
                  detailRow(
                    item.isPrihod
                        ? 'toAccount'.tr(context: context)
                        : 'fromAccount'.tr(context: context),
                    item.receiverAccount,
                  ),
                  detailRow(
                    'sendDate'.tr(context: context),
                    AppDateFormats.formatDdMMYyyy.format(item.paydate),
                  ),
                  detailRow(
                    item.isPrihod
                        ? 'prihodDate'.tr(context: context)
                        : 'rashodDate'.tr(context: context),
                    AppDateFormats.formatDdMMYyyy.format(item.trandate),
                  ),
                  detailRow('sender'.tr(context: context), item.payerName),
                  detailRow(
                    item.isPrihod
                        ? 'senderBank'.tr(context: context)
                        : 'recieverBank'.tr(context: context),
                    item.payerBankname,
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
