import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class EsiErrorScreen extends StatelessWidget {
  const EsiErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.esiErrorIcon,
              height: 90,
            ),
            const SizedBox(height: 22),
            Text(
              'Вы запретили передачу данных для данной информационной системы. Для разрешения передачи данных, Вам необходимо перейти в личный кабинет мобильного приложения «Tunduk»',
              style: AppTextStyles.s18W700(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            CustomButton(
              color: AppColors.esiMainBlueColor,
              onPress: () {
                AppRouting.pushAndPopUntilFunction(const AuthRoute());
              },
              text: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
