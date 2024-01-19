import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const TopTitleWidget(
                title: 'Авторизация',
                subTitle: 'Через единую систему идентификации ',
              ),
              const EsiTextFiled(
                keyboardType: TextInputType.number,
                hintText: 'Персональный номер',
                prfixIcon: AppImages.personIconSvg,
                suffixIcon: true,
              ),
              const SizedBox(height: 12),
              const EsiTextFiled(
                keyboardType: TextInputType.number,
                hintText: 'Номер паспорта',
                prfixIcon: AppImages.personIconSvg,
                suffixIcon: true,
              ),
              const SizedBox(height: 12),
              const EsiTextFiled(
                hintText: 'Пароль',
                prfixIcon: AppImages.passwordIconSvg,
                obscureText: true,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRouting.pushFunction(
                          const RecoveryPasswordChoiseTypeRoute());
                    },
                    child: Text(
                      'Забыли пароль?',
                      style: AppTextStyles.s13W700(
                          color: AppColors.esiMainBlueColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(
                borderColor: AppColors.esiMainBlueColor,
                color: Colors.white,
                textColor: AppColors.esiMainBlueColor,
                onPress: () {
                  AppRouting.pushFunction(const OEPRegisterRoute());
                },
                text: 'Получить ОЭП',
              ),
              const SizedBox(height: 32),
              Text.rich(
                TextSpan(
                  text:
                      'Нажав на кнопку «Далее», вы соглашаетесь, что прочитали и согласны с ',
                  style:
                      AppTextStyles.s12W500(color: AppColors.color727D8DGrey),
                  children: [
                    TextSpan(
                      text:
                          'Пользовательским соглашением и Политикой конфиденциальности',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: AppTextStyles.s12W500(
                          color: AppColors.esiMainBlueColor),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomButton(
                color: AppColors.esiMainBlueColor,
                onPress: () {
                  AppRouting.pushFunction(const AuthSendConfirmRoute());
                },
                text: 'Далее',
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
