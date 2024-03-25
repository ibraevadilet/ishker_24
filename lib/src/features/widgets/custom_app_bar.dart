import 'package:flutter/material.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.icon,
    this.titleWidget,
    this.centerTitle = true,
    this.actions,
    this.backgroundColor,
    this.titleTextStyle,
    this.iconColor,
    Key? key,
  }) : super(key: key);
  final String? title;
  final Widget? icon;
  final Widget? titleWidget;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? titleTextStyle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(title ?? ''),
      titleTextStyle: titleTextStyle ?? AppTextStyles.s20W700(),
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
        color: iconColor ?? AppColors.color727D8DGrey,
      ),
      leading: icon,
      actions: actions,
    );
  }
}
