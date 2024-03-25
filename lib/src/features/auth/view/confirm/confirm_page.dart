import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/confirm/cubit/confirm_cubit.dart';
import 'package:ishker_24/src/features/auth/view/widgets/esi_background_image_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/sms_code_input_widget.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';
import 'package:ishker_24/src/features/auth/view/widgets/top_title_widget.dart';
import 'package:ishker_24/src/features/widgets/custom_button.dart';
import 'package:ishker_24/src/theme/app_colors.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key, required this.authEntity});

  final AuthEntity authEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConfirmCubit(
        deviceInfo: sl(),
        getConfirmCodeUseCase: sl(),
        confirmCodeUseCase: sl(),
        authCubit: context.read<AuthCubit>(),
        twoFactorToken: authEntity.twoFactorSessionToken,
      ),
      child: BackgroundImageWidget(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, kToolbarHeight, 30, 0),
              child: BlocConsumer<ConfirmCubit, ConfirmState>(
                listener: (_, state) {
                  switch (state) {
                    case ConfirmFailure():
                      AppSnackBar.showSnackBar(state.exception.message);
                    case ConfirmConfirmed():
                      Navigator.pushNamed(
                        context,
                        state.entity.isSucceeded == true
                            ? pinCodeEnterRoute
                            : pinCodeRoute,
                        arguments: state.entity,
                      );
                    default:
                  }
                },
                builder: (_, state) {
                  switch (state) {
                    case ConfirmInitial() ||
                          // ConfirmSmsLoading() ||
                          // ConfirmEmailLoading() ||
                          // ConfirmTelegramLoading()
                          ConfirmSending():
                      return ConfirmInitialView(authEntity: authEntity);

                    default:
                      return ConfirmCodeView(method: state.method);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmInitialView extends StatefulWidget {
  const ConfirmInitialView({super.key, required this.authEntity});

  final AuthEntity authEntity;

  @override
  State<ConfirmInitialView> createState() => _ConfirmInitialViewState();
}

class _ConfirmInitialViewState extends State<ConfirmInitialView> {
  late String email;
  late String number;

  AuthEntity get entity => widget.authEntity;

  @override
  void initState() {
    super.initState();

    email =
        entity.body.where((e) => e.method == 'Email').first.emailFragment ?? '';
    number =
        entity.body.where((e) => e.method == 'Sms').first.phoneNumberFragment ??
            '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopTitleWidget(
          title: 'Подтверждение',
          subTitle:
              'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль в специальное окно.',
        ),
        EmailNumberWidget(email: email, number: number),
        const SizedBox(height: 42),
        Expanded(
          child: Column(
            children: entity.body
                .map<Widget>(
                  (e) => Expanded(
                    child: Column(
                      children: [
                        BlocBuilder<ConfirmCubit, ConfirmState>(
                          builder: (context, state) {
                            return CustomButton(
                              loadingColor: e.method == 'Telegram'
                                  ? AppColors.esiMainBlueColor
                                  : Colors.white,
                              isLoading: state is ConfirmSending &&
                                  state.method == e.method,
                              //  e.method == 'Telegram'
                              //     ? state is ConfirmTelegramLoading
                              //     : e.method == 'Sms'
                              //         ? state is ConfirmSmsLoading
                              //         : state is ConfirmEmailLoading,
                              textColor: e.method == 'Telegram'
                                  ? AppColors.esiMainBlueColor
                                  : Colors.white,
                              borderColor: e.method == 'Telegram'
                                  ? AppColors.esiMainBlueColor
                                  : Colors.white,
                              color: e.method == 'Telegram'
                                  ? Colors.white
                                  : AppColors.esiMainBlueColor,
                              onPress: () {
                                context.read<ConfirmCubit>().getConfirmCode(
                                      e.method,
                                      entity.twoFactorSessionToken,
                                    );
                                // AppRouting.pushFunction(
                                //   const AuthConfirmCodeRoute(),
                                // );
                              },
                              text: switch (e.method) {
                                'Telegram' => 'Получить код через Telegram',
                                'Email' => 'Получить код через почту',
                                _ => 'Получить код через СМС',
                              },
                            );
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class EmailNumberWidget extends StatelessWidget {
  const EmailNumberWidget({
    super.key,
    required this.email,
    required this.number,
  });

  final String email;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: AppColors.color4479BABlue.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.color617796Grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Text(email, style: AppTextStyles.s14W600()),
          Text(number, style: AppTextStyles.s14W600()),
        ],
      ),
    );
  }
}

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({super.key, required this.method});

  final String method;

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopTitleWidget(title: 'Код подтверждения'),
        Builder(
          builder: (context) => SmsCodeInputWidget(controller: _controller),
        ),
        const SizedBox(height: 32),
        BlocBuilder<ConfirmCubit, ConfirmState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is ConfirmConfirming,
              color: AppColors.esiMainBlueColor,
              onPress: () {
                final value = _controller.text.trim();
                if (value.isNotEmpty && value.length == 6) {
                  context.read<ConfirmCubit>().confirm(widget.method, value);
                }
              },
              text: 'Продолжить',
            );
          },
        ),
      ],
    );
  }
}
