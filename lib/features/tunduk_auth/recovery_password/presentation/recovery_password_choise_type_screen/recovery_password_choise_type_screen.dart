import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/widgets/choise_type_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class RecoveryPasswordChoiseTypeScreen extends StatelessWidget {
  const RecoveryPasswordChoiseTypeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TopTitleWidget(
            title: 'Забыли пароль?',
            subTitle: 'Выберите способ восстановления\nпароля',
          ),
          ChoiseTypeWidget(
            onPressed: () {
              AppRouting.pushFunction(
                  RecoveryPasswordEnterInnRoute(isSmsRecovery: true));
            },
            title: 'Восстановить пароль через СМС',
            icon: AppImages.recoverySmsIconSvg,
          ),
          const SizedBox(height: 22),
          ChoiseTypeWidget(
            onPressed: () {
              AppRouting.pushFunction(RecoveryPasswordEnterInnRoute());
            },
            title: 'Восстановить пароль через почту',
            icon: AppImages.recoveryEmailIconSvg,
          ),
        ],
      ),
    );
  }
}
