import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class IpInProccessWidget extends StatelessWidget {
  const IpInProccessWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Center(child: SvgPicture.asset(AppImages.empyListIconSvg)),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'Ваша заявка на получение ИП в обработке',
            style: AppTextStyles.s16W500(),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        const Spacer(),
      ],
    );
  }
}
