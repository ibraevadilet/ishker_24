import 'package:flutter/material.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

mixin PrimaryTextFieldMixin {
  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      );

  TextStyle get txtStyle => AppTextStyles.s16W400(color: Colors.black);
  EdgeInsets get padding => const EdgeInsets.all(16);

  Widget buildTextField({
    required TextEditingController controller,
    String? hintText,
    bool? obscureText,
    Widget? prefixIcon,
    Color? fillColor,
    FocusNode? focusNode,
    bool isActive = false,
    bool onlyNum = false,
    bool enabled = true,
    Widget? label,
    Widget? prefix,
    int? maxLength,
    EdgeInsets? contentPadding,
    OutlineInputBorder? outlineInputBorder,
    TextStyle? textStyle,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    bool filled = true,
    Function(String)? onChanged,
    Widget? prefixIcon2,
    Widget? suffix,
    String? labelText,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      keyboardType: onlyNum
          ? keyboardType ?? TextInputType.number
          : keyboardType ?? TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      enabled: enabled,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffix: suffix,
        label: label,
        labelText: labelText,
        prefixIcon: prefixIcon2,
        labelStyle: textStyle ?? txtStyle,
        prefix: prefix,
        counterText: '',
        hintText: hintText,
        hintStyle: textStyle ?? txtStyle,
        border: outlineInputBorder ?? border,
        disabledBorder: outlineInputBorder ?? border,
        enabledBorder: outlineInputBorder ?? border,
        focusedBorder: outlineInputBorder ?? border,
        errorBorder: enabled
            ? outlineInputBorder == null
                ? border.copyWith(
                    borderSide: const BorderSide(color: Colors.red),
                  )
                : outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: Colors.red),
                  )
            : outlineInputBorder ?? border,
        focusedErrorBorder: outlineInputBorder == null
            ? border.copyWith(
                borderSide: const BorderSide(color: Colors.red),
              )
            : outlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red),
              ),
        contentPadding: contentPadding ?? padding,
        fillColor: fillColor ?? Colors.white,
        filled: filled,
        suffixIcon: isActive
            ? prefixIcon ??
                IconButton(
                  onPressed: () {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => controller.clear());
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black,
                  ),
                )
            : null,
      ),
    );
  }
}
