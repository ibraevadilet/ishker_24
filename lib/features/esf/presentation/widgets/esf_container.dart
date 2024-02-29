import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class EsfContainer extends StatelessWidget {
  const EsfContainer({
    super.key,
    required this.createDate,
    required this.operationType,
    required this.status,
    required this.counterparty,
    required this.totalCost,
    this.onTap,
  });
  final String createDate;
  final String operationType;
  final String status;
  final String counterparty;
  final String totalCost;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Дата создания',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    createDate,
                    style: AppTextStyles.s16W500(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Вид операции',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    operationType,
                    style: AppTextStyles.s16W500(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Статус',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    status,
                    style: AppTextStyles.s16W500(
                        color: AppColors.color32D681Green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Контрагент',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Flexible(
                  child: Text(
                    counterparty,
                    style: AppTextStyles.s16W500(),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Общая стоимость',
                  style:
                      AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
                ),
                Text(
                  totalCost,
                  style: AppTextStyles.s16W500(),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
