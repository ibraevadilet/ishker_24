import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_sms_code_screen/reset_password_token_cubit/reset_password_token_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RecoveryPasswordEnterSmsCodeScreen extends StatelessWidget {
  const RecoveryPasswordEnterSmsCodeScreen({
    super.key,
    this.isSmsRecovery = false,
    required this.contact,
  });

  final bool isSmsRecovery;
  final String contact;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPasswordTokenCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopTitleWidget(
                title: 'Восстановление пароля',
                subTitle: isSmsRecovery
                    ? 'Мы отправили SMS с шестизначным кодом\nподтверждения на номер $contact\nВведите код.'
                    : 'Мы отправили шестизначный код\nподтверждения на вашу почту\n$contact  Введите код.',
              ),
              Builder(
                builder: (context) => SmsCodeInputWidget(
                  controller:
                      context.read<ResetPasswordTokenCubit>().otpController,
                ),
              ),
              const SizedBox(height: 42),
              BlocBuilder<ResetPasswordTokenCubit, ResetPasswordTokenState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state.isLoading,
                    color: AppColors.esiMainBlueColor,
                    onPress: () {
                      context
                          .read<ResetPasswordTokenCubit>()
                          .resetPasswordToken();
                    },
                    text: 'Продолжить',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
