import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class EmptyIpWidget extends StatelessWidget {
  const EmptyIpWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.empyListIconSvg),
        const Spacer(),
        Text(
          'Чтобы начать полноценно пользоваться всеми возможностями нашего сервиса, мы предлагаем вам зарегистрироваться как индивидуального предпринимателя (ИП). Регистрация проста и займет всего несколько минут.',
          style: AppTextStyles.s16W500(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        CustomButton(
          onPress: () {
            AppRouting.pushFunction(const RegisterIPMainRoute());
          },
          text: 'Регистрация ИП',
        ),
        const Spacer(),
      ],
    );
  }
}
