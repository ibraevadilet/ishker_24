import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/widgets/register_check_box_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class RegisterIPConfirmOepScreen extends StatelessWidget {
  const RegisterIPConfirmOepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(height: 38),
                    SvgPicture.asset(
                      AppImages.signatureImage,
                    ),
                    const SizedBox(height: 56),
                    Text(
                      'Для регистрации ИП необходимо\nподтвердить заявку электронной подписью\n(ОЭП) и дать согласие на обработку\nперсональных данных, включая\nинформацию о налоговой тайне.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s16W500(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RegisterCheckBoxWidget(),
                        const SizedBox(width: 14),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  '${AppTextConstants.userStatement}ru');
                              if (!await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception(
                                  'Could not launch $url',
                                );
                              }
                            },
                            child: Text(
                              'Заявление (на Согласие/Отзыв) субъекта на\nсбор и обработку его персональных данных сведений, составляющих налоговую тайну.',
                              style: AppTextStyles.s14W400(
                                color: AppColors.color54B25AMain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                radius: 16,
                color: AppColors.color54B25AMain,
                onPress: () {},
                text: 'Подписать',
              ),
              const SizedBox(height: 8),
              CustomButton(
                color: Colors.transparent,
                onPress: () {
                  context.router.pop();
                },
                text: 'Отмена',
                textColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
