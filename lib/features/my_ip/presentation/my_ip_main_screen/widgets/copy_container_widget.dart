import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class CopyContainerWidget extends StatelessWidget {
  const CopyContainerWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.color7A7A7AGrey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.s12W600(
                      color: AppColors.color6B7583Grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle,
                    style: AppTextStyles.s16W600(),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: subTitle),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Текст скопирован в буфер обмена'),
                    ),
                  );
                },
                child: SvgPicture.asset(AppImages.copyIconSvg),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
