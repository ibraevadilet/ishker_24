import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: isSelected ? AppColors.color54B25AMain : Colors.transparent,
        // borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.transparent,
          splashColor: AppColors.esiMainBlueColor.withOpacity(.15),
          child: SizedBox(
            height: 36,
            child: Center(
              child: Text(
                label,
                style: AppTextStyles.s16W600(
                  color: isSelected
                      ? AppColors.backgroundColor
                      : AppColors.color6B7583Grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
