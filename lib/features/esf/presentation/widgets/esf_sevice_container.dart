import 'package:flutter/material.dart';
import 'package:ishker_24/features/esf/data/models/esf_model.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class EsfSeviceContainer extends StatelessWidget {
  const EsfSeviceContainer({super.key, required this.model});
  final Invoice model;
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
                model.number,
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
                model.totalAmount.toString(),
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
