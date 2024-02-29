import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class StaticContainerInfoWidget extends StatelessWidget {
  const StaticContainerInfoWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorF3F4F5Grey,
      ),
      child: Text(
        title,
        style: AppTextStyles.s14W600(
          color: AppColors.color4E4E4EGrey,
        ),
      ),
    );
  }
}
