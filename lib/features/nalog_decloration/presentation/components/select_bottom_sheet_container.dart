import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class SelectBottomSheetContainer extends StatelessWidget {
  const SelectBottomSheetContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorF3F4F5Grey,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Год',
              style: AppTextStyles.s14W600(),
            ),
          ),
          const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.color7A7A7AGrey,
            ),
          )
        ],
      ),
    );
  }
}
