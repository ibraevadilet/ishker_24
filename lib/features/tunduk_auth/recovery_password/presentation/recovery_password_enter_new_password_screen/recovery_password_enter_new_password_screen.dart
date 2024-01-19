import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_new_password_screen/widgets/show_success_dialog.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esi_text_filed.dart';

@RoutePage()
class RecoveryPasswordEnterNewPasswordScreen extends StatefulWidget {
  const RecoveryPasswordEnterNewPasswordScreen({super.key});

  @override
  State<RecoveryPasswordEnterNewPasswordScreen> createState() =>
      _RecoveryPasswordEnterNewPasswordScreenState();
}

class _RecoveryPasswordEnterNewPasswordScreenState
    extends State<RecoveryPasswordEnterNewPasswordScreen> {
  bool get is10characters => newPassword.length > 9;
  bool get isHaveNumber => RegExp(r'[0-9]').hasMatch(newPassword);
  bool get isHaveLetters => RegExp(r'[a-zA-Z]').hasMatch(newPassword);
  bool get isHaveSymbol => RegExp(r'[-_.!@#$%*]').hasMatch(newPassword);

  String newPassword = '';

  bool get getAllRight =>
      is10characters && isHaveLetters && isHaveNumber && isHaveSymbol;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      bgColor: Colors.white.withOpacity(0.98),
      appBar: CustomAppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: TopTitleWidget(
                title: 'Новый пароль',
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Пароль должен соответствовать',
                    style: AppTextStyles.s12W500(),
                  ),
                  Text(
                    'следующим правилам:',
                    style: AppTextStyles.s12W500(),
                  ),
                  Text(
                    ' • Минимум 10 символов',
                    style: AppTextStyles.s12W500(
                      color: newPassword.isEmpty
                          ? null
                          : is10characters
                              ? AppColors.color1EA31EGreen
                              : AppColors.colorFF0000Red,
                    ),
                  ),
                  Text(
                    ' • Цифра (0 - 9)',
                    style: AppTextStyles.s12W500(
                      color: newPassword.isEmpty
                          ? null
                          : isHaveNumber
                              ? AppColors.color1EA31EGreen
                              : AppColors.colorFF0000Red,
                    ),
                  ),
                  Text(
                    ' • Латинская буква (a - z)',
                    style: AppTextStyles.s12W500(
                      color: newPassword.isEmpty
                          ? null
                          : isHaveLetters
                              ? AppColors.color1EA31EGreen
                              : AppColors.colorFF0000Red,
                    ),
                  ),
                  Text(
                    ' • Спец символ (-_.!@#\$%*)',
                    style: AppTextStyles.s12W500(
                      color: newPassword.isEmpty
                          ? null
                          : isHaveSymbol
                              ? AppColors.color1EA31EGreen
                              : AppColors.colorFF0000Red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            EsiTextFiled(
              hintText: 'Новый пароль',
              prfixIcon: AppImages.passwordIconSvg,
              onChanged: (val) {
                setState(() {
                  newPassword = val;
                });
              },
              obscureText: true,
            ),
            const SizedBox(height: 33),
            const EsiTextFiled(
              hintText: 'Подтвердите новый пароль',
              prfixIcon: AppImages.passwordIconSvg,
              obscureText: true,
            ),
            const SizedBox(height: 33),
            CustomButton(
              color: AppColors.esiMainBlueColor,
              onPress: () async => await showSuccessDialog(context),
              text: 'Восстановить пароль',
            ),
          ],
        ),
      ),
    );
  }
}
