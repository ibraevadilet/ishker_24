import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

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
    this.height,
    this.contentPadding,
    this.hintStyle,
    this.borderRadius = 12,
    this.borderColor,
    this.textStyle,
    this.focusNode,
    this.enabled = true,
    this.suffixIcon,
    this.autofocus = false,
    this.isId = false,
    this.maxLines = 1,
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
  final Widget? suffixIcon;
  final bool isId;
  final double? height;
  final Function(String)? onChanged;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final double borderRadius;
  final Color? borderColor;
  final FocusNode? focusNode;
  final bool enabled;
  final bool autofocus;
  final int? maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor ?? AppColors.color7A7A7AGrey,
          width: 1,
        ),
      ),
      child: TextFormField(
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        style: widget.textStyle ?? AppTextStyles.s15W600(),
        maxLines: widget.maxLines,
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
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 12),
          labelStyle: AppTextStyles.s14W600(color: AppColors.color6B7583Grey),
          prefixText: widget.prefixText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintStyle: widget.hintStyle,
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
