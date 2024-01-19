import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/widgets/email_number_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class AuthSendConfirmScreen extends StatelessWidget {
  const AuthSendConfirmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TopTitleWidget(
            title: 'Подтверждение',
            subTitle:
                'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль в специальное окно.',
          ),
          const EmailNumberWidget(),
          const SizedBox(height: 42),
          CustomButton(
            color: AppColors.esiMainBlueColor,
            onPress: () {
              AppRouting.pushFunction(const AuthConfirmCodeRoute());
            },
            text: 'Получить код через почту',
          ),
          const Spacer(),
          CustomButton(
            color: AppColors.esiMainBlueColor,
            onPress: () {
              AppRouting.pushFunction(const AuthConfirmCodeRoute());
            },
            text: 'Получить код через СМС',
          ),
          const Spacer(),
          CustomButton(
            color: Colors.white,
            onPress: () {
              AppRouting.pushFunction(const AuthConfirmCodeRoute());
            },
            text: 'Получить код через Telegram',
            textColor: AppColors.esiMainBlueColor,
            borderColor: AppColors.esiMainBlueColor,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
