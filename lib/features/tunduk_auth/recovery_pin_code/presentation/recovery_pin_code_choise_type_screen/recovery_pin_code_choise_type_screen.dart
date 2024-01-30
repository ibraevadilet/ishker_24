import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/cubits/send_reset_pin_code_cubit/send_reset_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/widgets/choise_type_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class RecoveryPinCodeChoiseTypeScreen extends StatelessWidget {
  const RecoveryPinCodeChoiseTypeScreen({super.key, required this.password});
  final String password;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SendResetPinCodeCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: BlocBuilder<SendResetPinCodeCubit, SendResetPinCodeState>(
          builder: (context, state) {
            return Column(
              children: [
                const TopTitleWidget(
                  title: 'Восстановление пин-кода',
                  subTitle: 'Выберите способ восстановления\nпин-кода',
                ),
                ChoiseTypeWidget(
                  isLoading: state.loadingSms,
                  onPressed: () {
                    context
                        .read<SendResetPinCodeCubit>()
                        .sendResetPassword(password, 'SMS');
                  },
                  title: 'Восстановить пароль через СМС',
                  icon: AppImages.recoverySmsIconSvg,
                ),
                const SizedBox(height: 22),
                ChoiseTypeWidget(
                  isLoading: state.loadingEmail,
                  onPressed: () {
                    context
                        .read<SendResetPinCodeCubit>()
                        .sendResetPassword(password, 'EMAIL');
                  },
                  title: 'Восстановить пароль через почту',
                  icon: AppImages.recoveryEmailIconSvg,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
