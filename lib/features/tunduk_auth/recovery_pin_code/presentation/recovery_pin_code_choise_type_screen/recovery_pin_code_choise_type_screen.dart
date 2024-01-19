import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/widgets/choise_type_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class RecoveryPinCodeChoiseTypeScreen extends StatelessWidget {
  const RecoveryPinCodeChoiseTypeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TopTitleWidget(
            title: 'Восстановление пин-кода',
            subTitle: 'Выберите способ восстановления\nпин-кода',
          ),
          ChoiseTypeWidget(
            onPressed: () {
              AppRouting.pushFunction(const RecoveryPinCodeEnterSmsCodeRoute());
            },
            title: 'Восстановить пароль через СМС',
            icon: AppImages.recoverySmsIconSvg,
          ),
          const SizedBox(height: 22),
          ChoiseTypeWidget(
            onPressed: () {
              AppRouting.pushFunction(const RecoveryPinCodeEnterSmsCodeRoute());
            },
            title: 'Восстановить пароль через почту',
            icon: AppImages.recoveryEmailIconSvg,
          ),
        ],
      ),
    );
  }
}
