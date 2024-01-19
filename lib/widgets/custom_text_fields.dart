import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/core/formatters/input_borders.dart';

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

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
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
        prefixText: widget.prefixText,
        prefixIcon: widget.prefixIcon,
        counter: const SizedBox(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: widget.isOutline
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.unOutlineBorderColorE5E5E5Width1,
        enabledBorder: widget.isOutline == true
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        focusedBorder: widget.isOutline == true
            ? InputBorders.outlineBorderColorGreenWidth2Radius10
            : InputBorders.unOutlineBorderColorGreenWidth2,
        focusedErrorBorder: widget.isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
        errorBorder: widget.isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
      ),
    );
  }
}
