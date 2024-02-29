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
  final int value;
  final int? groupValue;
  final String title;
  final void Function(int?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Row(
        children: [
          Radio<int>(
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
      ),
    );
  }
}
