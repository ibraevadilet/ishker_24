import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/widgets/email_number_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class AuthSendConfirmScreen extends StatelessWidget {
  const AuthSendConfirmScreen({super.key, required this.authModel});
  final AuthModel authModel;

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
          EmailNumberWidget(
            email: authModel.body
                    .where((e) => e.method == 'Email')
                    .first
                    .emailFragment ??
                '',
            number: authModel.body
                    .where((e) => e.method == 'Sms')
                    .first
                    .phoneNumberFragment ??
                '',
          ),
          const SizedBox(height: 42),
          Expanded(
            child: Column(
              children: authModel.body
                  .where((e) => e.enabled)
                  .map<Widget>(
                    (e) => Expanded(
                      child: Column(
                        children: [
                          CustomButton(
                            textColor: e.method == 'Telegram'
                                ? AppColors.esiMainBlueColor
                                : Colors.white,
                            borderColor: e.method == 'Telegram'
                                ? AppColors.esiMainBlueColor
                                : Colors.white,
                            color: e.method == 'Telegram'
                                ? Colors.white
                                : AppColors.esiMainBlueColor,
                            onPress: () {
                              AppRouting.pushFunction(
                                  const AuthConfirmCodeRoute());
                            },
                            text: getText(e.method),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(String method) {
  switch (method) {
    case 'Telegram':
      return 'Получить код через Telegram';
    case 'Email':
      return 'Получить код через почту';
    case 'Sms':
      return 'Получить код через СМС';
    default:
      return '';
  }
}
