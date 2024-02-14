import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class DeclinedIPWidget extends StatelessWidget {
  const DeclinedIPWidget({super.key, required this.reason, required this.date});
  final String reason;
  final DateTime date;
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
            reason,
            style: AppTextStyles.s16W500(),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            DateFormat('dd MMMM yyyy').format(date),
            style: AppTextStyles.s16W500(),
            textAlign: TextAlign.center,
          ),
        ),
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
