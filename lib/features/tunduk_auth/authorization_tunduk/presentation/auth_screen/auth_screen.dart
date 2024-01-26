import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/cubits/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
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
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Builder(
              builder: (context) => Form(
                key: context.read<AuthCubit>().formKey,
                child: Column(
                  children: [
                    const TopTitleWidget(
                      title: 'Авторизация',
                      subTitle: 'Через единую систему идентификации ',
                    ),
                    EsiTextFiled(
                      keyboardType: TextInputType.number,
                      hintText: 'Персональный номер',
                      prfixIcon: AppImages.personIconSvg,
                      suffixIcon: true,
                      controller: context.read<AuthCubit>().loginController,
                      validator: AppInputValidators.innValidator,
                    ),
                    const SizedBox(height: 12),
                    EsiTextFiled(
                      hintText: 'Пароль',
                      prfixIcon: AppImages.passwordIconSvg,
                      obscureText: true,
                      controller: context.read<AuthCubit>().passwordController,
                      validator: AppInputValidators.emptyValidator,
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
                        style: AppTextStyles.s12W500(
                            color: AppColors.color727D8DGrey),
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
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: state.isLoading,
                          color: AppColors.esiMainBlueColor,
                          onPress: () {
                            // AppRouting.pushFunction(
                            //   AuthSendConfirmRoute(
                            //     authModel: AuthModel(
                            //       requestId:
                            //           'a85220fe-7369-43ec-8454-fbaacb65c4ac',
                            //       body: [
                            //         Body(
                            //           method: 'Telegram',
                            //           enabled: true,
                            //           phoneNumberFragment: null,
                            //           emailFragment: null,
                            //         ),
                            //         Body(
                            //           method: 'Email',
                            //           enabled: true,
                            //           phoneNumberFragment: null,
                            //           emailFragment:
                            //               'j*****************2@gmail.com',
                            //         ),
                            //         Body(
                            //           method: 'Sms',
                            //           enabled: true,
                            //           phoneNumberFragment: '+99699*****23',
                            //           emailFragment: null,
                            //         ),
                            //       ],
                            //       errors: null,
                            //       succeeded: true,
                            //       twoFactorSessionToken:
                            //           'CfDJ8DVWRrhIBSdLuSzJI7yO2I2rpH-BZidrkqfa73qOryrZtDO0b7PJpnHqFpr7UwlhyHZ2XrBp9mMhPGeVFR09j4RIhfd9zcrbT0SXZYWVfagRElyiGGQ',
                            //     ),
                            //   ),
                            // );
                            context.read<AuthCubit>().getAuth();
                          },
                          text: 'Далее',
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
