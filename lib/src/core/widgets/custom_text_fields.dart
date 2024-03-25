import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.hintText,
    this.prefixText,
    this.maxLength,
    this.prefixIcon,
    this.onChanged,
    this.isId = false,
    this.enabled = true,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final String? hintText;
  final String? prefixText;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool isId;
  final Function(String)? onChanged;
  final bool enabled;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.color7A7A7AGrey,
          width: 1,
        ),
      ),
      child: TextFormField(
        style: AppTextStyles.s15W600(),
        cursorColor: AppColors.color7A7A7AGrey,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        enabled: widget.enabled,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          if (widget.isId && widget.controller != null) {
            widget.controller!.text = value.toUpperCase();
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelStyle: AppTextStyles.s14W600(color: AppColors.color6B7583Grey),
          prefixText: widget.prefixText,
          prefixIcon: widget.prefixIcon,
          counter: const SizedBox(),
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixStyle: AppTextStyles.s15W600(),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
