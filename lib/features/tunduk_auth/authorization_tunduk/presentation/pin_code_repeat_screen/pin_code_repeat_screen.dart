import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_repeat_screen/cubits/set_pin_code_cubit/set_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/forgot_pin_text_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/number_key_board_for_pin_code.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/pin_code_input_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

@RoutePage()
class PinCodeRepeatScreen extends StatefulWidget {
  const PinCodeRepeatScreen(
      {super.key, required this.firstPin, required this.isNewPin});
  final String firstPin;
  final bool isNewPin;

  @override
  State<PinCodeRepeatScreen> createState() => _PinCodeRepeatScreenState();
}

class _PinCodeRepeatScreenState extends State<PinCodeRepeatScreen> {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SetPinCodeCubit>(),
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
                'Повторите еще раз',
                style: AppTextStyles.s22W400(
                  color: AppColors.color36424BGrey,
                ),
              ),
              const SizedBox(height: 12),
              Builder(
                builder: (context) => PinCodeInputWidget(
                  controller: pinController,
                  onCompleted: (val) {
                    if (widget.firstPin == val) {
                      if (widget.isNewPin) {
                        context.read<SetPinCodeCubit>().setNewPinCode(val);
                      } else {
                        context.read<SetPinCodeCubit>().setPinCode(val);
                      }
                    }
                  },
                  validator: (val) => AppInputValidators.pinCodeRepeatValidator(
                    str: val,
                    firstPin: widget.firstPin,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              NumberKeyBoardForPinCode(
                pinPutController: pinController,
              ),
              const ForgotPinTextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
