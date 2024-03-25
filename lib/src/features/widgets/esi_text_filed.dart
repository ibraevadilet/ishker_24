// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/formatters/input_borders.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class EsiTextFiled extends StatefulWidget {
  const EsiTextFiled({
    super.key,
    required this.hintText,
    required this.prfixIcon,
    this.inputFormatters,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon = false,
    this.onChanged,
  });

  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String hintText;
  final String prfixIcon;
  final bool suffixIcon;
  final Function(String)? onChanged;

  @override
  State<EsiTextFiled> createState() => _EsiTextFiledState();
}

class _EsiTextFiledState extends State<EsiTextFiled> {
  late bool isObscure = widget.obscureText;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      shadowColor: AppColors.color4479BABlue.withOpacity(0.05),
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: AppColors.color7A7A7AGrey,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: isObscure,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    AppImages.personWarningIconSvg,
                  ),
                )
              : widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          isObscure
                              ? AppImages.eyePasswordCloseSvg
                              : AppImages.eyePasswordOpenSvg,
                        ),
                      ),
                    )
                  : null,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20),
              SvgPicture.asset(
                widget.prfixIcon,
                color: AppColors.color617796Grey,
              ),
              const SizedBox(width: 15),
              Container(
                width: 1,
                height: 16,
                color: AppColors.color617796Grey,
              ),
              const SizedBox(width: 15),
            ],
          ),
          hintStyle: AppTextStyles.s14W600(color: AppColors.color617796Grey),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          border: InputBorders.esiBorder,
          enabledBorder: InputBorders.esiBorder,
          focusedBorder: InputBorders.esiBorder,
          focusedErrorBorder: InputBorders.esiBorder,
          errorBorder: InputBorders.esiBorder,
        ),
      ),
    );
  }
}
