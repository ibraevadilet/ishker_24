import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_text_field.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class EsfEmptyTokenWidget extends StatelessWidget {
  const EsfEmptyTokenWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text:
                          'Для просмотра электронных счет-фактур\nвам необходимо авторизоваться в ',
                      style: AppTextStyles.s16W500(),
                      children: [
                        TextSpan(
                            text: 'Кабинете Налогоплательщика',
                            style: AppTextStyles.s16W600().copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.color54B25AMain,
                                decorationColor: AppColors.color54B25AMain),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchUrl(
                                  Uri.parse('https://cabinet.salyk.kg/'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                        const TextSpan(
                          text:
                              ' и сгенерировать токен в разделе «Генерация токена».',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),
                  Text(
                    'Загрузите полученный токен в следующее\nполе:',
                    style: AppTextStyles.s14W500(),
                  ),
                  const SizedBox(height: 8),
                  const CustomTextField(),
                  const SizedBox(height: 8),
                  Text(
                    'Загрузить файл',
                    style: AppTextStyles.s16W500(
                      color: AppColors.color54B25AMain,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              onPress: () {},
              text: 'Принять',
            ),
          ),
        ],
      ),
    );
  }
}
