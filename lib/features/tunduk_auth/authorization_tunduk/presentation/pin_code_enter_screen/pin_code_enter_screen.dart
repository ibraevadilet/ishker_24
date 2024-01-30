// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/biometric_cubit/biometric_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/enter_pin_code_cubit/enter_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/widgets/show_alert_dialog.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/forgot_pin_text_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/number_key_board_for_pin_code.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/pin_code_input_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

@RoutePage()
class PinCodeEnterScreen extends StatefulWidget {
  const PinCodeEnterScreen({super.key});

  @override
  State<PinCodeEnterScreen> createState() => _PinCodeEnterScreenState();
}

class _PinCodeEnterScreenState extends State<PinCodeEnterScreen> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<EnterPinCodeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<BiometricCubit>(),
        ),
      ],
      child: ScaffoldBackgroundImageWidget(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                AppImages.esiPinTextLogoWhite,
                height: 36,
              ),
              const SizedBox(height: 32),
              Text(
                'Введите пин-код',
                style: AppTextStyles.s22W400(
                  color: AppColors.color36424BGrey,
                ),
              ),
              const SizedBox(height: 12),
              BlocConsumer<EnterPinCodeCubit, EnterPinCodeState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () async {
                      await showBioDialog(context, pinController.text);
                      AppRouting.pushAndPopUntilFunction(
                        const BottomNavigatorRoute(),
                      );
                    },
                    error: (error) {
                      pinController.clear();
                    },
                  );
                },
                builder: (context, state) {
                  return PinCodeInputWidget(
                    onChanged: (val) {
                      if (val.length < 4) {
                        context.read<BiometricCubit>().getBioType(val);
                      }
                    },
                    controller: pinController,
                    onCompleted: (val) {
                      context.read<EnterPinCodeCubit>().enterPinCode(val);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<BiometricCubit, BiometricState>(
                builder: (context, state) {
                  return NumberKeyBoardForPinCode(
                    pinPutController: pinController,
                    isBiometric: state.isBioSupported,
                    type: state.type,
                  );
                },
              ),
              const ForgotPinTextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
