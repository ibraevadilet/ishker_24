import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class OEPFinishScreen extends StatelessWidget {
  const OEPFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 48),
            SizedBox(
              height: 172,
              child: Image.asset(AppImages.cesImage),
            ),
            const Text(
              'Ваш пароль от облачной электронной\nодписи будет выслан Вам на почту',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Ознакомиться с Соглашением о присоединении к\nрегламенту УЦ ГП «Инфоком»',
              style: AppTextStyles.s14W400(
                color: AppColors.color34C759Green,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.color34C759Green,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              radius: 16,
              color: AppColors.color54B25AMain,
              onPress: () => AppRouting.pushAndPopUntilFunction(
                const AuthRoute(),
              ),
              child: Text(
                'На главную',
                textAlign: TextAlign.center,
                style: AppTextStyles.s16W700(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
