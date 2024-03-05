import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class EmptyOepScreen extends StatelessWidget {
  const EmptyOepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                AppImages.arrowForwardIcon,
                height: 10,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(AppImages.empyListIconSvg),
              const SizedBox(height: 50),
              Text(
                'У Вас отсутствует облачная электронная подпись, она необходима для подачи заявки. Воспользуйтесь сервисом удаленного получения подписи',
                style: AppTextStyles.s16W500(),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                onPress: () {
                  AppRouting.pushFunction(
                    const OEPRegisterRoute(),
                  );
                },
                text: 'Перейти на сервис',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
