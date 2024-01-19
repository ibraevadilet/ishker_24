import 'package:flutter/material.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class TopTitleWidget extends StatelessWidget {
  const TopTitleWidget({
    super.key,
    required this.title,
    this.subTitle,
  });
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.esiLogoImage,
          height: 36,
        ),
        const SizedBox(height: 60),
        Text(
          title,
          style: AppTextStyles.s22W700(color: AppColors.esiMainBlueColor),
          textAlign: TextAlign.center,
        ),
        if (subTitle != null) ...[
          const SizedBox(height: 8.0),
          Text(
            subTitle!,
            style: AppTextStyles.s14W600(color: AppColors.color727D8DGrey),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 40.0),
      ],
    );
  }
}
