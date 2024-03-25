import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/formatters/validators.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/login/cubits/login_cubit/login_cubit.dart';
import 'package:ishker_24/src/features/auth/view/widgets/esi_background_image_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/esi_text_filed.dart';
import 'package:ishker_24/src/features/auth/view/widgets/top_title_widget.dart';
import 'package:ishker_24/src/features/widgets/app_error_text.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/widgets/custom_button.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/esia_cubit/esia_terms_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TermsCubit(sl())),
        BlocProvider(
          create: (_) => LoginCubit(
            loginUseCase: sl(),
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: const BackgroundImageWidget(
        slivers: [
          SliverToBoxAdapter(child: SafeArea(child: LoginForm())),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> _getTerms() async {
    final temp = Platform.isIOS
        ? await getTemporaryDirectory()
        : await getExternalStorageDirectory();
    final file = File('${temp?.path}/EsiaTerms.pdf');

    if (mounted) context.read<TermsCubit>().load(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, kToolbarHeight, 30, 0),
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
              controller: loginController,
              validator: AppInputValidators.innValidator,
              inputFormatters: [
                LengthLimitingTextInputFormatter(14),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            const SizedBox(height: 12),
            EsiTextFiled(
              hintText: 'Пароль',
              prfixIcon: AppImages.passwordIconSvg,
              obscureText: true,
              controller: passwordController,
              validator: AppInputValidators.emptyValidator,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    //TODO:
                    // AppRouting.pushFunction(
                    //     const RecoveryPasswordChoiseTypeRoute());
                  },
                  child: Text(
                    'Забыли пароль?',
                    style: AppTextStyles.s13W700(
                      color: AppColors.esiMainBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            BlocConsumer<TermsCubit, TermsState>(
              listener: (context, state) {
                if (state is TermsSuccess) {
                  Navigator.pushNamed(
                    context,
                    pdfRoute,
                    arguments: state.path,
                  );
                }
              },
              builder: (context, state) => switch (state) {
                TermsLoading() =>
                  const AppIndicator(color: AppColors.esiMainBlueColor),
                TermsFailure() => AppErrorText(
                    error: state.exception.message,
                  ),
                _ => Text.rich(
                    TextSpan(
                      text:
                          'Нажав на кнопку «Далее», вы соглашаетесь, что прочитали и согласны с ',
                      style: AppTextStyles.s10W600(
                          color: AppColors.color727D8DGrey),
                      children: [
                        TextSpan(
                          text:
                              'Пользовательским соглашением и Политикой конфиденциальности',
                          recognizer: TapGestureRecognizer()..onTap = _getTerms,
                          style: AppTextStyles.s10W600(
                            color: AppColors.esiMainBlueColor,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
              },
            ),
            const SizedBox(height: 32),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                switch (state) {
                  case LoginSuccess():
                    Navigator.pushNamed(
                      context,
                      confirmRoute,
                      arguments: state.entity,
                    );
                  case LoginFailure():
                    AppSnackBar.showSnackBar(state.exception.message);
                  default:
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is LoginLoading,
                  color: AppColors.esiMainBlueColor,
                  onPress: () {
                    if (_formKey.currentState?.validate() == true) {
                      context.read<LoginCubit>().login(
                            loginController.text.trim(),
                            passwordController.text.trim(),
                          );
                    }
                  },
                  text: 'Далее',
                );
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              borderColor: AppColors.esiMainBlueColor,
              color: Colors.white,
              textColor: AppColors.esiMainBlueColor,
              onPress: () => Navigator.pushNamed(context, signupRoute),
              text: 'Получить ОЭП',
            ),
          ],
        ),
      ),
    );
  }
}
