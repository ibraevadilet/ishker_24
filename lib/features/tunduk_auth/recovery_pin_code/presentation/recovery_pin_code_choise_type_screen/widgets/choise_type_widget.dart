import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class ChoiseTypeWidget extends StatelessWidget {
  const ChoiseTypeWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    this.isLoading = false,
  });
  final Function() onPressed;
  final String icon;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
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
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            isLoading
                ? const AppIndicator(
                    color: AppColors.esiMainBlueColor,
                  )
                : SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.s14W600(),
            ),
          ],
        ),
      ),
    );
  }
}
