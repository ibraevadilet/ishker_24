import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class EmptyAccountWidget extends StatelessWidget {
  const EmptyAccountWidget({
    required this.partyId,
    super.key,
  });
  final String partyId;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SvgPicture.asset(AppImages.empyListIconSvg),
        const Spacer(),
        Text(
          'Поздравляем с успешной регистрацией Клиента в нашем банке! Теперь предлагаем вам открыть счет для максимального комфорта использования наших сервисов.',
          style: AppTextStyles.s16W500(),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        CustomButton(
          onPress: () =>
              AppRouting.pushFunction(OpenAccountRoute(partyId: partyId)),
          text: 'Открыть счет',
        ),
        const Spacer(),
      ],
    );
  }
}
