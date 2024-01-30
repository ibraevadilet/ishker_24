import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_sms_code_screen/reset_pin_code_token_cubit/reset_pin_code_token_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RecoveryPinCodeEnterSmsCodeScreen extends StatefulWidget {
  const RecoveryPinCodeEnterSmsCodeScreen(
      {super.key, required this.method, required this.userId});
  final String method;
  final String userId;

  @override
  State<RecoveryPinCodeEnterSmsCodeScreen> createState() =>
      _RecoveryPinCodeEnterSmsCodeScreenState();
}

class _RecoveryPinCodeEnterSmsCodeScreenState
    extends State<RecoveryPinCodeEnterSmsCodeScreen> {
  late final subTitle = widget.method == 'SMS'
      ? 'Мы отправили SMS с шестизначным кодом\nподтверждения на номер ${widget.userId}\nВведите код.'
      : 'Мы отправили шестизначный код подтверждения на вашу почту ${widget.userId}  Введите код.';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPinCodeTokenCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            TopTitleWidget(
              title: 'Восстановление пин-кода',
              subTitle: subTitle,
            ),
            Builder(
              builder: (context) => SmsCodeInputWidget(
                controller: context.read<ResetPinCodeTokenCubit>().controller,
              ),
            ),
            const SizedBox(height: 42),
            BlocBuilder<ResetPinCodeTokenCubit, ResetPinCodeTokenState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state.isLoading,
                  color: AppColors.esiMainBlueColor,
                  onPress: () {
                    context.read<ResetPinCodeTokenCubit>().resetPinCode();
                  },
                  text: 'Продолжить',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
