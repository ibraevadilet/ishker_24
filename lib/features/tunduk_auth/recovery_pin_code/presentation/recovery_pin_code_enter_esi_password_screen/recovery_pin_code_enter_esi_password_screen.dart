import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esi_text_filed.dart';

@RoutePage()
class RecoveryPinCodeEnterEsiPasswordScreen extends StatefulWidget {
  const RecoveryPinCodeEnterEsiPasswordScreen({super.key});

  @override
  State<RecoveryPinCodeEnterEsiPasswordScreen> createState() =>
      _RecoveryPinCodeEnterEsiPasswordScreenState();
}

class _RecoveryPinCodeEnterEsiPasswordScreenState
    extends State<RecoveryPinCodeEnterEsiPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopTitleWidget(
              title: 'Восстановление пин-кода',
            ),
            Form(
              key: formKey,
              child: EsiTextFiled(
                controller: passwordController,
                hintText: 'Пароль',
                prfixIcon: AppImages.passwordIconSvg,
                obscureText: true,
                validator: AppInputValidators.emptyValidator,
              ),
            ),
            const SizedBox(height: 42),
            CustomButton(
              color: AppColors.esiMainBlueColor,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  AppRouting.pushFunction(
                    RecoveryPinCodeChoiseTypeRoute(
                      password: passwordController.text,
                    ),
                  );
                }
              },
              text: 'Продолжить',
            ),
            const SizedBox(height: 22),
            Text.rich(
              TextSpan(
                text: 'Забыли пароль? ',
                style: AppTextStyles.s14W600(color: AppColors.color727D8DGrey),
                children: [
                  TextSpan(
                    text: 'Восстановите',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppRouting.pushFunction(
                            const RecoveryPasswordChoiseTypeRoute());
                      },
                    style: AppTextStyles.s14W600(
                        color: AppColors.esiMainBlueColor),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
