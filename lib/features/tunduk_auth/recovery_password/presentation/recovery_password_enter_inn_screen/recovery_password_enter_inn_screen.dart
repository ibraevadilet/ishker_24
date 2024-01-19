import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esi_text_filed.dart';

@RoutePage()
class RecoveryPasswordEnterInnScreen extends StatelessWidget {
  const RecoveryPasswordEnterInnScreen({super.key, this.isSmsRecovery = false});
  final bool isSmsRecovery;
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          TopTitleWidget(
            title:
                'Восстановить пароль через ${isSmsRecovery ? 'СМС' : 'почту'}',
          ),
          const EsiTextFiled(
            keyboardType: TextInputType.number,
            hintText: 'Персональный номер',
            prfixIcon: AppImages.personIconSvg,
          ),
          const SizedBox(height: 12),
          isSmsRecovery
              ? const EsiTextFiled(
                  keyboardType: TextInputType.number,
                  hintText: 'Номер телефона',
                  prfixIcon: AppImages.phoneIconSvg,
                )
              : const EsiTextFiled(
                  keyboardType: TextInputType.number,
                  hintText: 'Почта',
                  prfixIcon: AppImages.recoveryEmailIconSvg,
                ),
          const SizedBox(height: 33),
          CustomButton(
            color: AppColors.esiMainBlueColor,
            onPress: () {
              AppRouting.pushFunction(
                RecoveryPasswordEnterSmsCodeRoute(isSmsRecovery: isSmsRecovery),
              );
            },
            text: 'Отправить код подтверждения',
          ),
        ],
      ),
    );
  }
}
