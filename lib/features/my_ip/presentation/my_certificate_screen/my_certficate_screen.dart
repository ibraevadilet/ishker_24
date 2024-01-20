import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class MyCertficateScreen extends StatelessWidget {
  const MyCertficateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Свидетельство ИП',
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                AppImages.ipImage,
              ),
            ),
            const SizedBox(height: 22),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.shareIcon,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Поделиться',
                      style: AppTextStyles.s16W600(
                        color: AppColors.color54B25AMain,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
