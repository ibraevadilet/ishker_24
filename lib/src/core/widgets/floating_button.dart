import 'package:flutter/material.dart';
import 'package:ishker_24/src/features/auth/view/widgets/custom_button.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    this.onTap,
    this.title,
    this.bkgColor,
    this.textStyle,
    this.borderColor,
  }) : super(key: key);
  final String? title;
  final VoidCallback? onTap;
  final Color? bkgColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  void _onTap() {
    if (onTap != null) {
      onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width - 32,
      child: CustomButton(
        radius: 16,
        color: bkgColor!,
        borderColor: borderColor,
        onPress: () => _onTap(),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: AppTextStyles.s16W700(color: Colors.white),
        ),
      ),
    );
  }
}
