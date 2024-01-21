import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_pin_code_receiving_cubit/get_pin_code_receiving_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/widgets/sms_confirm_sheet.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class RegisterIpConfirmOepScreen extends StatelessWidget {
  const RegisterIpConfirmOepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetPinCodeReceivingCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SendOtpCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'Подтверждение',
                  style: AppTextStyles.s24W700(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль',
                  style:
                      AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                BlocBuilder<GetPinCodeReceivingCubit, GetPinCodeReceivingState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) =>
                          BlocConsumer<SendOtpCubit, SendOtpState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            error: (error) => AppSnackBar.showSnackBar(error),
                            success: (authType, isNewOpen) {
                              if (isNewOpen) {
                                smsConfirmSheet(
                                  context,
                                  () {
                                    context
                                        .read<SendOtpCubit>()
                                        .sendOtp(authType, false);
                                  },
                                );
                              }
                            },
                          );
                        },
                        builder: (context, state) {
                          return model.length == 1
                              ? CustomButton(
                                  loadingColor: model.first.authType == 'email'
                                      ? AppColors.color54B25AMain
                                      : Colors.white,
                                  isLoading: state.isLoading,
                                  textColor: model.first.authType == 'email'
                                      ? AppColors.color54B25AMain
                                      : Colors.white,
                                  borderColor: model.first.authType == 'email'
                                      ? AppColors.color54B25AMain
                                      : null,
                                  color: model.first.authType == 'email'
                                      ? Colors.white
                                      : AppColors.color54B25AMain,
                                  onPress: () {
                                    context
                                        .read<SendOtpCubit>()
                                        .sendOtp(model.first.authType);
                                  },
                                  text: model.first.authType == 'email'
                                      ? 'Получить код на почту'
                                      : 'Получить код через смс',
                                )
                              : Column(
                                  children: [
                                    CustomButton(
                                      isLoading: state.emailLoading,
                                      onPress: () {
                                        context
                                            .read<SendOtpCubit>()
                                            .sendOtp(model[0].authType);
                                      },
                                      text: smsType(model[0].authType),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'или',
                                      style: AppTextStyles.s16W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    CustomButton(
                                      loadingColor: AppColors.color54B25AMain,
                                      isLoading: state.smsLoading,
                                      textColor: AppColors.color54B25AMain,
                                      borderColor: AppColors.color54B25AMain,
                                      color: Colors.white,
                                      onPress: () {
                                        context
                                            .read<SendOtpCubit>()
                                            .sendOtp(model[1].authType);
                                      },
                                      text: smsType(model[1].authType),
                                    ),
                                  ],
                                );
                        },
                      ),
                    );
                  },
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String smsType(String authType) {
  switch (authType) {
    case 'email':
      return 'Получить код на почту';
    case 'sms':
      return 'Получить код через смс';
    default:
      return 'Получить код через смс';
  }
}
