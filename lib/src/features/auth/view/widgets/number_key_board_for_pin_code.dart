import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/features/auth/view/widgets/exit_button.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:local_auth/local_auth.dart';

const List<int> pinNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class NumberKeyBoardForPinCode extends StatelessWidget {
  const NumberKeyBoardForPinCode({
    required this.pinPutController,
    this.isBiometric = false,
    this.type = BiometricType.fingerprint,
    this.onTapExit,
    this.onBioPressed,
    Key? key,
  }) : super(key: key);

  final TextEditingController pinPutController;
  final bool isBiometric;
  final BiometricType type;
  final VoidCallback? onTapExit;
  final VoidCallback? onBioPressed;

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
                if (pinPutController.text.length >= 4) return;

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
        ExitButton(onTap: onTapExit),
        TextButton(
          onPressed: () {
            if (pinPutController.text.length >= 4) return;

            pinPutController.text = '${pinPutController.text}0';
          },
          child: Text(
            '0',
            style: AppTextStyles.s38W300(color: AppColors.color36424BGrey),
          ),
        ),
        isBiometric
            ? IconButton(
                onPressed: onBioPressed,
                icon: SvgPicture.asset(
                  type == BiometricType.fingerprint
                      ? AppImages.fingerPrintIconSvg
                      : AppImages.faceIdIconSvg,
                ),
              )
            : IconButton(
                onPressed: () {
                  String value = pinPutController.text;
                  if (value.isNotEmpty) {
                    pinPutController.text =
                        value.substring(0, value.length - 1);
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
