import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsCodeInputWidget extends StatelessWidget {
  const SmsCodeInputWidget({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: AppColors.color617796Grey,
      textStyle: AppTextStyles.s30W500(),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 60,
        fieldWidth: 46,
        inactiveColor: AppColors.color617796Grey.withOpacity(0.1),
        activeColor: AppColors.color617796Grey.withOpacity(0.1),
        selectedColor: AppColors.color617796Grey.withOpacity(0.1),
        disabledColor: AppColors.color617796Grey.withOpacity(0.1),
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      validator: (val) => AppInputValidators.esiSmsCodeValidator(str: val),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      onChanged: (value) {},
    );
  }
}
