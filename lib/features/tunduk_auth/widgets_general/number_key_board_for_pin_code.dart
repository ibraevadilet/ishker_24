import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/pin_code_numbers.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/biometric_cubit/biometric_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/exit_button.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:local_auth/local_auth.dart';

class NumberKeyBoardForPinCode extends StatelessWidget {
  const NumberKeyBoardForPinCode({
    required this.pinPutController,
    this.isBiometric = false,
    this.type = BiometricType.fingerprint,
    Key? key,
  }) : super(key: key);

  final TextEditingController pinPutController;
  final bool isBiometric;
  final BiometricType type;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 24,
      mainAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...pinNumbers.map(
          (number) {
            return TextButton(
              onPressed: () {
                if (pinPutController.text.length >= 4) {
                  return;
                }
                pinPutController.text = '${pinPutController.text}$number';
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              child: Text(
                number.toString(),
                style: AppTextStyles.s38W300(color: AppColors.color36424BGrey),
              ),
            );
          },
        ),
        const ExitButton(),
        TextButton(
          onPressed: () {
            if (pinPutController.text.length >= 4) {
              return;
            }
            pinPutController.text = '${pinPutController.text}0';
          },
          child: Text(
            '0',
            style: AppTextStyles.s38W300(color: AppColors.color36424BGrey),
          ),
        ),
        isBiometric
            ? IconButton(
                onPressed: () {
                  context.read<BiometricCubit>().checkBio();
                },
                icon: SvgPicture.asset(
                  type == BiometricType.fingerprint
                      ? AppImages.fingerPrintIconSvg
                      : AppImages.faceIdIconSvg,
                ),
              )
            : IconButton(
                onPressed: () {
                  if (pinPutController.text.isNotEmpty) {
                    pinPutController.text = pinPutController.text
                        .substring(0, pinPutController.text.length - 1);
                  }
                },
                icon: const Icon(
                  Icons.backspace,
                  color: AppColors.esiMainBlueColor,
                  size: 40,
                ),
              ),
      ],
    );
  }
}
