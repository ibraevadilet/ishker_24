import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class AuthConfirmCodeScreen extends StatelessWidget {
  const AuthConfirmCodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TopTitleWidget(
            title: 'Код подтверждения',
          ),
          const SmsCodeInputWidget(),
          const SizedBox(height: 32),
          CustomButton(
            color: AppColors.esiMainBlueColor,
            onPress: () {
              AppRouting.pushFunction(PinCodeCreateRoute());
            },
            text: 'Продолжить',
          ),
        ],
      ),
    );
  }
}
