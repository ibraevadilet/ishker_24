import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';

class CustomRadioWidget extends StatelessWidget {
  const CustomRadioWidget({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    required this.title,
  });
  final String value;
  final String? groupValue;
  final String title;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          fillColor: MaterialStateColor.resolveWith(
              (states) => AppColors.color32D681Green),
          splashRadius: 2,
          activeColor: AppColors.color32D681Green,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}
