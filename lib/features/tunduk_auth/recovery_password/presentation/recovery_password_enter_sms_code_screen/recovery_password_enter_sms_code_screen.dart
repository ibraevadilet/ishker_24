import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RecoveryPasswordEnterSmsCodeScreen extends StatelessWidget {
  const RecoveryPasswordEnterSmsCodeScreen({
    super.key,
    this.isSmsRecovery = false,
  });

  final bool isSmsRecovery;
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopTitleWidget(
              title: 'Восстановление пароля',
              subTitle: isSmsRecovery
                  ? 'Мы отправили SMS с шестизначным кодом\nподтверждения на номер +99670*****16\nВведите код.'
                  : 'Мы отправили шестизначный код\nподтверждения на вашу почту\nadmin@gmail.com  Введите код.',
            ),
            const SmsCodeInputWidget(),
            const SizedBox(height: 42),
            CustomButton(
              color: AppColors.esiMainBlueColor,
              onPress: () {
                AppRouting.pushFunction(
                  const RecoveryPasswordEnterNewPasswordRoute(),
                );
              },
              text: 'Продолжить',
            ),
          ],
        ),
      ),
    );
  }
}
