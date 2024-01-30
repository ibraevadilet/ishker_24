import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/cubits/confirm_received_code_cubit/confirm_received_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class AuthConfirmCodeScreen extends StatelessWidget {
  const AuthConfirmCodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ConfirmReceivedCodeCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const TopTitleWidget(
              title: 'Код подтверждения',
            ),
            Builder(
              builder: (context) => SmsCodeInputWidget(
                controller:
                    context.read<ConfirmReceivedCodeCubit>().smsCodeController,
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<ConfirmReceivedCodeCubit, ConfirmReceivedCodeState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state.isLoading,
                  color: AppColors.esiMainBlueColor,
                  onPress: () {
                    context.read<ConfirmReceivedCodeCubit>().confirmCode();
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
