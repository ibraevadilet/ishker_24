import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class EsfSeviceContainer extends StatelessWidget {
  const EsfSeviceContainer({
    super.key,
    required this.number,
    required this.product,
    required this.unit,
    required this.gked,
    required this.factCount,
    required this.price,
    required this.vatAmount,
    required this.nsp,
    required this.nspAmount,
    required this.gtdNumber,
    required this.costWitoutTax,
    required this.totalCost,
  });
  final String number;
  final String product;
  final String unit;
  final String gked;
  final String factCount;
  final String price;
  final String vatAmount;
  final String nsp;
  final String nspAmount;
  final String gtdNumber;
  final String costWitoutTax;
  final String totalCost;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Номер',
                style: AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
              ),
              Text(
                number,
                style: AppTextStyles.s16W500(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Общая стоимость',
                style: AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
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
    );
  }
}
