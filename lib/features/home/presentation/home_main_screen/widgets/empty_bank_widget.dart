import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class EmptyBankWidget extends StatelessWidget {
  const EmptyBankWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ИП Нуждин Сергей Иванович',
              style: AppTextStyles.s16W600(),
            ),
            SvgPicture.asset(AppImages.notificationIconSvg),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(AppImages.empyListIconSvg),
        const Spacer(),
        Text(
          'Поздравляем с успешной регистрацией ИП в нашем приложении! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
          style: AppTextStyles.s16W500(),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        CustomButton(
          onPress: () {},
          text: 'Открыть счет',
        ),
        const Spacer(),
      ],
    );
  }
}
