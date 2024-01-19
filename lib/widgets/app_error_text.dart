import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/translations/locale_keys.g.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';

class AppErrorText extends StatelessWidget {
  const AppErrorText({
    required this.error,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String error;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              error,
              style: AppTextStyles.s16W400(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            onPress != null
                ? CustomButton(
                    width: null,
                    text: LocaleKeys.retry.tr(),
                    color: Colors.black,
                    onPress: onPress!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
