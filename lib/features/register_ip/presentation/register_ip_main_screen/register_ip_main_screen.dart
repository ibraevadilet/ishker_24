import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RegisterIPMainScreen extends StatelessWidget {
  const RegisterIPMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Регистрация ИП',
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 14),
                      SvgPicture.asset(
                        AppImages.signatureImage,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'У Вас нет заявок на получение ИП',
                        style: AppTextStyles.s16W500(),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.color54B25AMain,
                  onPress: () {
                    AppRouting.pushFunction(const RegisterIPRoute());
                  },
                  text: 'Подать заявку',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
