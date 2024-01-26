import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class EmailNumberWidget extends StatelessWidget {
  const EmailNumberWidget(
      {super.key, required this.email, required this.number});
  final String email;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: AppColors.color4479BABlue.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.color617796Grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Text(
            email,
            style: AppTextStyles.s14W600(),
          ),
          Text(
            number,
            style: AppTextStyles.s14W600(),
          ),
        ],
      ),
    );
  }
}
