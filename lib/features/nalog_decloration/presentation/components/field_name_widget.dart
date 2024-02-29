import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class FieldNameWidget extends StatelessWidget {
  const FieldNameWidget({super.key, required this.number, required this.title});
  final String number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.color32D681Green,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            number,
            style: AppTextStyles.s12W500(color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.s14W600(),
          ),
        ),
      ],
    );
  }
}
