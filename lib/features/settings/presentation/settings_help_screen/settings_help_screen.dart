import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsHelpScreen extends StatelessWidget {
  const SettingsHelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'Помощь',
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Выберите удобный для Вас\nканал поддержки:',
                textAlign: TextAlign.center,
                style: AppTextStyles.s16W500(),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPress: () async {
                await launchUrl(
                  Uri.parse('https://t.me/+996755002400'),
                  mode: LaunchMode.externalApplication,
                );
              },
              height: 64,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.telegramIcon),
                      const SizedBox(width: 8),
                      Text(
                        'Telegram',
                        style: AppTextStyles.s16W500(),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPress: () async {
                await launchUrl(
                  Uri.parse('https://api.whatsapp.com/send?phone=996755002400'),
                  mode: LaunchMode.externalApplication,
                );
              },
              height: 64,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.whatsappIcon),
                      const SizedBox(width: 8),
                      Text(
                        'WhatsApp',
                        style: AppTextStyles.s16W500(),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPress: () async {
                await launchUrl(
                  Uri.parse('tel:*2400'),
                  mode: LaunchMode.externalApplication,
                );
              },
              height: 64,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.callIcon),
                      const SizedBox(width: 8),
                      Text(
                        'Позвонить',
                        style: AppTextStyles.s16W500(),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // CustomButton(
            //   onPress: () {},
            //   height: 64,
            //   color: Colors.white,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           SvgPicture.asset(AppImages.questionIcon),
            //           const SizedBox(width: 8),
            //           Text(
            //             'Часто задаваемые вопросы',
            //             style: AppTextStyles.s16W500(),
            //           ),
            //         ],
            //       ),
            //       const Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.black,
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
