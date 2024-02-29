import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title = '',
    this.titleWidget,
    this.trailing,
    this.trailingWidget,
    this.ontap,
  });

  final String title;
  final Widget? titleWidget;
  final String? trailing;
  final Widget? trailingWidget;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      tileColor: Colors.white,
      title: titleWidget ??
          Text(
            title,
            style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
          ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      trailing: trailingWidget == null
          ? const SizedBox.shrink()
          : trailingWidget ??
              Text(
                trailing ?? '',
                style: AppTextStyles.s12W400(color: AppColors.color2C2C2CBlack),
              ),
    );
  }
}
