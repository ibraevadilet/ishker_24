import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/core/utils/modal_bottom_sheet.dart';
import 'package:ishker_24/features/account/domain/entities/history.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_listtile.dart';

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
              'Детали операции',
              style: AppTextStyles.s16W500(
                color: AppColors.color2C2C2CBlack,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailRow('Сумма',
                      '${AppCurrencyFormatter.currencyCash(item.amount)} C'),
                  detailRow(
                    'Операция',
                    item.isPrihod ? 'Начисление' : 'Списание',
                  ),
                  detailRow(
                    item.isPrihod ? 'На счет' : 'Со счета',
                    item.receiverAccount,
                  ),
                  detailRow(
                    'Дата отправки',
                    AppDateFormats.formatDdMMYyyy.format(item.paydate),
                  ),
                  detailRow(
                    'Дата ${item.isPrihod ? 'начисления' : 'списания'}',
                    AppDateFormats.formatDdMMYyyy.format(item.trandate),
                  ),
                  detailRow('Отправитель', item.payerName),
                  detailRow(
                    'Банк ${item.isPrihod ? 'отправителя' : 'получателя'}',
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
              style: AppTextStyles.s15W600(
                color: AppColors.color2C2C2CBlack,
              ),
            ),
            Text(
              AppDateFormats.formatDdMMYyyy.format(item.trandate),
              style: AppTextStyles.s12W400(
                color: AppColors.color2C2C2CBlack,
              ),
            )
          ],
        ),
        trailingWidget: Text(
          '${item.isPrihod ? '+' : '-'}${AppCurrencyFormatter.currencyCash(item.amount)} C',
          style: AppTextStyles.s16W700(
            color: item.isPrihod
                ? AppColors.color54B25AMain
                : AppColors.color2C2C2CBlack,
          ),
        ),
      ),
    );
  }
}
