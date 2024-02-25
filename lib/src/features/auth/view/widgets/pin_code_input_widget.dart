import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeInputWidget extends StatelessWidget {
  const PinCodeInputWidget({
    super.key,
    this.controller,
    this.onCompleted,
    this.onChanged,
    this.validator,
  });
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      cursorHeight: 1,
      readOnly: true,
      obscuringCharacter: ' ',
      mainAxisAlignment: MainAxisAlignment.center,
      appContext: context,
      length: 4,
      obscureText: true,
      animationType: AnimationType.fade,
      cursorColor: Colors.white,
      textStyle: AppTextStyles.s12W500(color: AppColors.esiMainBlueColor),
      pinTheme: PinTheme(
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
        borderWidth: 1,
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(50),
        fieldHeight: 20,
        fieldWidth: 20,
        inactiveColor: Colors.black,
        activeColor: AppColors.esiMainBlueColor,
        selectedColor: Colors.black,
        disabledColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeFillColor: AppColors.esiMainBlueColor,
      ),
      validator: validator,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      onChanged: onChanged ?? (val) {},
      onCompleted: onCompleted,
    );
  }
}
