import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/theme/app_colors.dart';

const border = OutlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.color7A7A7AGrey,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
  });
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
